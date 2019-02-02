module Page.Auth exposing (authForm)

import Auth.Model exposing (Authentication)
import Auth.Messages exposing (Msg(..))
import Element exposing
    ( centerX
    , centerY
    , column
    , el
    , Element
    , fill
    , fillPortion
    , height
    , rgba255
    , row
    , text
    , width
    )
import Element.Background as Background
import Element.Border as Border
import Styles.Styles exposing (full)


----------
-- Auth Form
----------
authForm : Authentication -> Element Msg
authForm _ =
    row full
        [ column [ height fill, width <| fillPortion 2 ] [ Element.none ]
        , column
            [ height fill
            , width <| fillPortion 6
            , Border.widthEach
                { bottom = 0
                , left = 1
                , right = 1
                , top = 0
                }
            , Background.color <| rgba255 0 100 0 0.5
            ]
            [ el [ centerX, centerY ] <| text "World!" ]
        , column [ height fill, width <| fillPortion 2 ] [ Element.none ]
        ]