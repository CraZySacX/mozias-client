module Base.Updates exposing (..)

import Auth.Messages exposing (..)
import Auth.Model exposing (AuthError(..))
import Auth.Updates exposing (update)
import Base.Messages exposing (..)
import Base.Model exposing (BaseModel)
import Debug exposing (toString)
import Http exposing (Error(..))
import Jwt exposing (JwtError(..))

authTranslator : Auth.Messages.Translator BaseMsg
authTranslator =
    Auth.Messages.translator { onInternalMessage = AuthMsg, onAuthSuccess = AuthSuccess, onAuthError = AuthError }

update : BaseMsg -> BaseModel -> ( BaseModel, Cmd BaseMsg )
update msg model =
    case msg of
        GetQuote ->
            ( { model | quote = model.quote ++ "A quote! " }, Cmd.none )

        AuthMsg subMsg ->
            let
                ( updatedAuthModel, authCmd ) =
                    Auth.Updates.update subMsg model.authentication model.baseUrl

                newModel =
                    { model | authentication = updatedAuthModel }
            in
                ( newModel, Cmd.map authTranslator authCmd )

        AuthSuccess ->
            ( model, Cmd.none )

        AuthError error ->
            ( Debug.log (case error of
                HttpError httpError ->
                    toString httpError

                TokenError tokenError ->
                    toString tokenError) model, Cmd.none)