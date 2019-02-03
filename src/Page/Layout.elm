module Page.Layout exposing (pageLayout)

import Base.Messages exposing (Msg(..))
import Base.Model exposing (Model)
import Element exposing (column, Element)
import Page.Body exposing (bodyRow)
import Page.Footer exposing (footerRow)
import Page.Header exposing (headerRow)
import Styles.Styles exposing (full)



----------
-- Page Layout
----------
pageLayout : Model -> Element Msg
pageLayout model =
    column full [ headerRow model, bodyRow model, footerRow model ]
