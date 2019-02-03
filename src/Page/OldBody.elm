module Page.OldBody exposing (bodyRow)

import Base.Messages exposing (Msg(..))
import Base.Model exposing (Model)
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
bodyRow : Model -> Element Msg
bodyRow model =
    if model.authentication.authenticated then
        authenticatedBody model
    else
        -- map authTranslator <| view model.authentication
        map authTranslator <| authForm model.authentication


authenticatedBody : Model -> Element Msg
authenticatedBody model =
    column full [ buttonRow, quoteRow model ]


buttonRow : Element Msg
buttonRow =
    row full [ quoteButton ]


quoteButton : Element Msg
quoteButton =
    Input.button [ centerX ]
        { label = text "Grab a joke!"
        , onPress = Just GetQuote
        }


quoteRow : Model -> Element Msg
quoteRow model =
    row full [ quoteParagraph model ]


quoteParagraph : Model -> Element Msg
quoteParagraph model =
    paragraph [ centerX ] [ text model.quote ]