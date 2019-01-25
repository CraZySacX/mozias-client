module Pages.Home exposing (page)

import Base.Messages exposing (..)
import Base.Model exposing (Model)
import Pages.Common exposing (h2)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Input as Input

headingRow : Element Msg
headingRow =
    row [ width fill, padding 10 ] [ dadJokesHeading ]

dadJokesHeading : Element Msg
dadJokesHeading =
    el (List.append h2 [ centerX ]) (Element.text "Dad Jokes")

buttonRow : Element Msg
buttonRow =
    row [ width fill, padding 10 ] [ quoteButton ]

quoteButton : Element Msg
quoteButton =
    Input.button [ centerX ]
        { label = text "Grab a joke!"
        , onPress = Just GetQuote
        }

quoteRow : Model -> Element Msg
quoteRow model =
    row [ centerX ] [ paragraph [] [text model.quote] ]

page : Model -> Element Msg
page model =
    column [ width fill ]
        [ headingRow
        , buttonRow
        , quoteRow model
        ]