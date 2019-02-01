module Pages.Home exposing (page)

import Auth.View exposing (view)
import Base.Messages exposing (BaseMsg(..))
import Base.Model exposing (BaseModel)
import Base.Updates exposing (authTranslator)
import Html exposing (map)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Input as Input
import Pages.Common exposing (h2)

headingRow : Element BaseMsg
headingRow =
    row []
        [ column [ width <| fillPortion 8, padding 10 ] [ dadJokesHeading ]
        , column [ width <| fillPortion 4, padding 10 ] [ dadJokesHeading ]
        ]

dadJokesHeading : Element BaseMsg
dadJokesHeading =
    el (List.append h2 [ centerX ]) (Element.text "Dad Jokes")

buttonRow : Element BaseMsg
buttonRow =
    row [ width fill, padding 10 ] [ quoteButton ]

quoteButton : Element BaseMsg
quoteButton =
    Input.button [ centerX ]
        { label = text "Grab a joke!"
        , onPress = Just GetQuote
        }

quoteRow : BaseModel -> Element BaseMsg
quoteRow model =
    row [ centerX ] [ paragraph [] [text model.quote] ]

mainContent : BaseModel -> Element BaseMsg
mainContent model =
    if model.authentication.authenticated then
        authenticatedContent model
    else
        Element.map authTranslator (Auth.View.view model.authentication)

authenticatedContent : BaseModel -> Element BaseMsg
authenticatedContent model =
    row [ width fill, height fill ]
        [ headingRow
        , buttonRow
        , quoteRow model
        ]

page : BaseModel -> Element BaseMsg
page model =
    mainContent model