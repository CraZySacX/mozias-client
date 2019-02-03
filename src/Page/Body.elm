module Page.Body exposing (mainContent)

import Base.Messages exposing (Msg)
import Base.Model exposing (Model, Page(..))
import Html exposing (Html)
import Bootstrap.Grid as Grid
import Page.Auth exposing (pageAuth)
import Page.GettingStarted exposing (pageGettingStarted)
import Page.Home exposing (pageHome)
import Page.Modules exposing (pageModules)
import Page.NotFound exposing (pageNotFound)


mainContent : Model -> Html Msg
mainContent model =
    Grid.container [] <|
        if model.authentication.authenticated then
            case model.page of
                Home ->
                    pageHome model

                GettingStarted ->
                    pageGettingStarted model

                Modules ->
                    pageModules model

                NotFound ->
                    pageNotFound
        else
            pageAuth model