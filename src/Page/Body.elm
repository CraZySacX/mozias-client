module Page.Body exposing (bodyRow)

import Base.Messages exposing (BaseMsg(..))
import Base.Model exposing (BaseModel)
import Base.Updates exposing (authTranslator)
import Element exposing
    ( centerX
    , column
    , Element
    , map
    , paragraph
    , row
    , text
    )
import Element.Background as Background
import Element.Border as Border
import Element.Input as Input
import Page.Auth exposing (authForm)
import Styles.Styles exposing (bodyStyle , full, h2)



----------
-- Body
----------
bodyRow : BaseModel -> Element BaseMsg
bodyRow model =
    if model.authentication.authenticated then
        authenticatedBody model
    else
        -- map authTranslator <| view model.authentication
        map authTranslator <| authForm model.authentication


authenticatedBody : BaseModel -> Element BaseMsg
authenticatedBody model =
    column full [ buttonRow, quoteRow model ]


buttonRow : Element BaseMsg
buttonRow =
    row full [ quoteButton ]


quoteButton : Element BaseMsg
quoteButton =
    Input.button [ centerX ]
        { label = text "Grab a joke!"
        , onPress = Just GetQuote
        }


quoteRow : BaseModel -> Element BaseMsg
quoteRow model =
    row full [ quoteParagraph model ]


quoteParagraph : BaseModel -> Element BaseMsg
quoteParagraph model =
    paragraph [ centerX ] [ text model.quote ]