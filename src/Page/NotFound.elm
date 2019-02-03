module Page.NotFound exposing (pageNotFound)

import Base.Messages exposing (Msg)
import Html exposing (h1, Html, text)


pageNotFound : List (Html Msg)
pageNotFound =
    [ h1 [] [ text "Not found" ]
    , text "SOrry couldn't find that page"
    ]