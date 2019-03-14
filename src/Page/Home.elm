module Page.Home exposing (pageHome)

import Base.Model exposing (Model)
import Base.Messages exposing (Msg(..))
import Bootstrap.Button as Button
import Bootstrap.Card as Card
import Bootstrap.Card.Block as Block
import Bootstrap.Grid as Grid
import Html exposing (h1, Html, text)
import Html.Attributes exposing (href)

pageHome : Model -> List (Html Msg)
pageHome model =
    [ h1 [] [ text "Home" ]
    , Grid.row []
        [ Grid.col []
            [ Card.config [ Card.outlinePrimary ]
                |> Card.headerH4 [] [ text "Art" ]
                |> Card.block []
                    [ Block.text [] [ text "My Art" ]
                    , Block.custom <|
                        Button.linkButton
                            [ Button.primary, Button.attrs [ href "#art" ] ]
                            [ text "Art" ]
                    ]
                |> Card.view
            ]
        , Grid.col []
            [ Card.config [ Card.outlineDanger ]
                |> Card.headerH4 [] [ text "Modules" ]
                |> Card.block []
                    [ Block.text [] [ text "Check out the modules overview" ]
                    , Block.custom <|
                        Button.linkButton
                            [ Button.primary, Button.attrs [ href "#writing" ] ]
                            [ text "Module" ]
                    ]
                |> Card.view
            ]
        ]
    ]