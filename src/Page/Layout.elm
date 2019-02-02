module Page.Layout exposing (pageLayout)

import Base.Messages exposing (BaseMsg(..))
import Base.Model exposing (BaseModel)
import Element exposing (column, Element)
import Page.Body exposing (bodyRow)
import Page.Footer exposing (footerRow)
import Page.Header exposing (headerRow)
import Styles.Styles exposing (full)



----------
-- Page Layout
----------
pageLayout : BaseModel -> Element BaseMsg
pageLayout model =
    column full [ headerRow model, bodyRow model, footerRow model ]
