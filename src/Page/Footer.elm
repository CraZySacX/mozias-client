module Page.Footer exposing (footerRow)

import Base.Messages exposing (Msg)
import Base.Model exposing (Model)
import Element exposing
    ( centerX
    , el
    , Element
    , row
    , text
    )
import Styles.Styles exposing (footerStyle)


----------
-- Footer
----------
footerRow : Model -> Element Msg
footerRow _ =
    row footerStyle [ footer ]


footer : Element Msg
footer =
    el [ centerX ] <| text <| "Footer"