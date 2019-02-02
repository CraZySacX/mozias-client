module Page.Footer exposing (footerRow)

import Base.Messages exposing (BaseMsg)
import Base.Model exposing (BaseModel)
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
footerRow : BaseModel -> Element BaseMsg
footerRow _ =
    row footerStyle [ footer ]


footer : Element BaseMsg
footer =
    el [ centerX ] <| text <| "Footer"