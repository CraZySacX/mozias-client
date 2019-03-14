module Page.Art exposing (pageArt)

import Base.Model exposing (Model)
import Base.Messages exposing (Msg(..))
import Bootstrap.Button as Button
import Html exposing (h2, Html, text)
import Html.Events exposing (onClick)


pageArt : Model -> List (Html Msg)
pageArt model =
    [ h2 [] [ text "My Art" ]
    , Button.button
        [ Button.success
        , Button.large
        , Button.block
        , Button.attrs [ onClick ShowModal ]
        ]
        [ text "Click me" ]
    ]