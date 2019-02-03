module Page.GettingStarted exposing (pageGettingStarted)

import Base.Model exposing (Model)
import Base.Messages exposing (Msg(..))
import Bootstrap.Button as Button
import Html exposing (h2, Html, text)
import Html.Events exposing (onClick)


pageGettingStarted : Model -> List (Html Msg)
pageGettingStarted model =
    [ h2 [] [ text "Getting started" ]
    , Button.button
        [ Button.success
        , Button.large
        , Button.block
        , Button.attrs [ onClick ShowModal ]
        ]
        [ text "Click me" ]
    ]