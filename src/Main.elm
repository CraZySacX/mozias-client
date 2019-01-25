module Main exposing (main)

import Base.Messages exposing (..)
import Base.Model exposing (Model)
import Browser exposing (..)
import Element exposing (layout)
import Pages.Home exposing (page)

init : () -> (Model, Cmd Msg)
init _ =
    ( Model "", Cmd.none )

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        GetQuote ->
            ( { model | quote = model.quote ++ "A quote! " }, Cmd.none )

view : Model -> Document Msg
view model = {
        title = "Makenzie Ozias"
        , body = [ Element.layout [] <| page model ]
    }

main : Program () Model Msg
main =
    Browser.document
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }