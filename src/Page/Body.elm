module Page.Body exposing (mainContent)

import Base.Messages exposing (Msg)
import Base.Model exposing (Model, Page(..))
import Html exposing (Html)
import Bootstrap.Grid as Grid
import Page.Auth exposing (pageAuth)
import Page.Art exposing (pageArt)
import Page.Home exposing (pageHome)
import Page.Modules exposing (pageModules)
import Page.NotFound exposing (pageNotFound)


mainContent : Model -> Html Msg
mainContent model =
    if model.authentication.authenticated then
        Grid.container [] <|
            case model.page of
                Home ->
                    pageHome model

                Art ->
                    pageArt model

                Modules ->
                    pageModules model

                NotFound ->
                    pageNotFound
    else
        Grid.container [] <| pageAuth model