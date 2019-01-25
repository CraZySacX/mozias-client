import Browser exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input

type alias Model =
    { quote : String
    }

type Msg = GetQuote

init : () -> (Model, Cmd Msg)
init _ =
    ( Model "", Cmd.none )


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        GetQuote ->
            ( { model | quote = model.quote ++ "A quote! " }, Cmd.none )

myElement : Element Msg
myElement =
    Element.el
        [ Background.color (rgb 0 0.5 0)
        , Border.color (rgb 0 0.7 0)
        ]
        (Element.text "You've made a stylish element!")

headingRow : Element Msg
headingRow =
    row [ width fill, padding 10 ] [ dadJokesHeading ]

buttonRow : Element Msg
buttonRow =
    row [ width fill, padding 10 ] [ quoteButton ]

page : Model -> Element Msg
page model =
    column [ width fill ]
        [ headingRow
        , buttonRow
        , row [ centerX ] [ paragraph [] [text model.quote] ]
        ]

quoteButton : Element Msg
quoteButton =
    Input.button [ centerX ]
        { label = text "Grab a joke!"
        , onPress = Just GetQuote
        }

dadJokesHeading : Element Msg
dadJokesHeading =
    el (List.append h2 [ centerX ]) (Element.text "Dad Jokes")

h2 : List (Element.Attribute msg)
h2 = [ Font.size 24, Font.bold ]

view : Model -> Document Msg
view model = {
        title = "Makenzie Ozias"
        , body = [ Element.layout [] <| page model ]
    }

main : Program () Model Msg
main =
    Browser.document
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }