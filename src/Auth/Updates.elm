module Auth.Updates exposing (..)

import Auth.Messages exposing (..)
import Auth.Model exposing (Authentication, AuthError(..), JwtPayload)
import Http exposing (expectJson, jsonBody, post, request)
import Json.Encode exposing (string, Value)
import Json.Decode exposing(Decoder, field, string)
import Jwt exposing (decodeToken, JwtError)
import Task exposing (Task)
import Time exposing (now, Posix, posixToMillis)

----------
-- Authentications Update Handling
----------
update : InternalMsg -> Authentication -> String -> ( Authentication, Cmd Msg )
update message auth baseUrl =
    case message of
        Login ->
            ( auth, authUser auth baseUrl )

        Logout ->
            ( Auth.Model.defaultAuthentication, Cmd.none )

        SetPassword password ->
            ( { auth | password = password }, Cmd.none )

        SetUsername username ->
            ( { auth | username = username }, Cmd.none )

        AuthUserResult result ->
            case result of
                Ok newToken ->
                    ( { auth | token = newToken, password = "" }, decodeTokenCmd newToken )

                Err error ->
                    authError auth (HttpError error)

        DecodeResult result ->
            case result of
                Ok payload ->
                    let
                        newModel =
                            { auth | payload = payload }
                    in
                        ( newModel, isAuthenticated newModel )

                Err error ->
                    authError auth (TokenError error)

        Authenticated authenticated ->
            let
                nextCmd =
                    case authenticated of
                        True ->
                            generateParentMsg AuthenticationSuccess

                        False ->
                            Cmd.none
            in
                ( { auth | authenticated = authenticated }, nextCmd )



----------
-- User Authentication request
----------
authUser : Authentication -> String -> Cmd Msg
authUser model baseUrl =
    Http.post
        { url = (baseUrl ++ authUrl)
        , body = Http.jsonBody <| userEncoder model
        , expect = Http.expectJson (ForSelf << AuthUserResult) tokenDecoder
        }


authUrl : String
authUrl =
    "/auth/token"


userEncoder : Authentication -> Json.Encode.Value
userEncoder model =
    Json.Encode.object
        [ ( "username", Json.Encode.string model.username )
        , ( "password", Json.Encode.string model.password )
        ]


tokenDecoder : Decoder String
tokenDecoder =
    field "refresh_token" Json.Decode.string



----------
-- Authentication Error Handling
----------
authError : Authentication -> AuthError -> ( Authentication, Cmd Msg )
authError auth error =
    ( { auth | username = "", password = "", token = "" }, generateParentMsg (AuthenticationError error) )



----------
-- JWT Token Decoding
----------
decodeTokenCmd : String -> Cmd Msg
decodeTokenCmd token =
    Task.attempt (ForSelf << DecodeResult) (fromDecodeResult <| decodeToken tokenPayloadDecoder token)


fromDecodeResult : Result JwtError JwtPayload -> Task JwtError JwtPayload
fromDecodeResult result =
    case result of
        Ok payload ->
            Task.succeed payload

        Err error ->
            Task.fail error


tokenPayloadDecoder : Decoder JwtPayload
tokenPayloadDecoder =
    Json.Decode.map7 JwtPayload
        (field "iss" Json.Decode.string)
        (field "sub" Json.Decode.string)
        (field "iat" Json.Decode.int)
        (field "nbf" Json.Decode.int)
        (field "exp" Json.Decode.int)
        (field "aid" Json.Decode.string)
        (field "tfa" Json.Decode.bool)



----------
-- Is authentication still valid now?
----------
isAuthenticated : Authentication -> Cmd Msg
isAuthenticated model =
    Task.perform (ForSelf << Authenticated << checkExpiry model) Time.now

checkExpiry : Authentication -> Posix -> Bool
checkExpiry model now =
    let
        seconds =
            floor ((toFloat <| posixToMillis now) / 1000)
    in
        seconds < model.payload.exp



----------
-- Utils
----------
generateParentMsg : ExternalMsg -> Cmd Msg
generateParentMsg externalMsg =
    Task.perform ForParent (Task.succeed externalMsg)