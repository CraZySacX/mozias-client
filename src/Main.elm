module Main exposing (main)

import Base.Messages exposing (Msg(..))
import Base.Model exposing (Model)
import Base.Subs exposing (subscriptions)
import Base.Updates exposing (update, urlUpdate)
import Bootstrap.Navbar as Navbar
import Browser exposing (..)
import Browser.Navigation as Navigation
import Html exposing (div)
import Page.Menu exposing (menu)
import Page.Body exposing (mainContent)
import Page.Modal exposing (modal)
import Url exposing (Url)

type alias Flags =
    {}

init : Flags -> Url -> Navigation.Key -> ( Model, Cmd Msg )
init flags url key =
    let
        ( navState, navCmd ) =
            Navbar.initialState NavMsg

        ( model, urlCmd ) =
            urlUpdate url <| Base.Model.init key navState
    in
        ( model, Cmd.batch [ urlCmd, navCmd ] )

view : Model -> Browser.Document Msg
view model =
    { title = "Makenzie Ozias"
    , body =
        [ div []
            [ menu model
            , mainContent model
            , modal model
            ]
        ]
    }

main : Program Flags Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlRequest = ClickedLink
        , onUrlChange = UrlChange
        }