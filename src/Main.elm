module Main exposing (main)

import Base.Messages exposing (BaseMsg)
import Base.Model exposing (BaseModel)
import Base.Updates exposing (update)
import Browser exposing (..)
import Element exposing (layout)
import Page.Layout exposing (pageLayout)

init : () -> (BaseModel, Cmd BaseMsg)
init _ =
    ( Base.Model.init, Cmd.none )

view : BaseModel -> Document BaseMsg
view model = {
        title = "Makenzie Ozias"
        , body = [ Element.layout [] <| pageLayout model ]
    }

main : Program () BaseModel BaseMsg
main =
    Browser.document
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }