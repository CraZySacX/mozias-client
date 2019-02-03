module Page.Modules exposing (pageModules)

import Base.Model exposing (Model)
import Base.Messages exposing (Msg(..))
import Bootstrap.ListGroup as ListGroup
import Html exposing (h1, Html, text)


pageModules : Model -> List (Html Msg)
pageModules model =
    [ h1 [] [ text "Modules" ]
    , ListGroup.ul
        [ ListGroup.li [] [ text "Alert" ]
        , ListGroup.li [] [ text "Badge" ]
        , ListGroup.li [] [ text "Card" ]
        ]
    ]