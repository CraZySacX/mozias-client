module Styles.Styles exposing (..)

import Base.Model exposing (BaseModel)
import Element exposing
    ( Attribute
    , centerX
    , fill
    , fillPortion
    , height
    , px
    , rgb255
    , width
    )
import Element.Background as Background
import Element.Font as Font

h2 : List (Attribute msg)
h2 =
    Font.size 24 :: Font.bold :: []

heightFill : List (Attribute msg)
heightFill  =
    height fill :: []


widthFill : List (Attribute msg)
widthFill =
    width fill :: []


full : List (Attribute msg)
full =
    heightFill ++ widthFill


portion6 : List (Attribute msg)
portion6 =
    [ width <| fillPortion 6 ]


headerStyle : List (Attribute msg)
headerStyle =
    widthFill ++ sixtyPx ++ redBackground


bodyStyle : List (Attribute msg)
bodyStyle =
    full ++ greyBackground ++ Font.size 48 :: []


redBackground : List (Attribute msg)
redBackground =
    [ Background.color <| rgb255 255 0 0 ]


greyBackground : List (Attribute msg)
greyBackground =
    [ Background.color <| rgb255 192 192 192 ]


greenBackground : List (Attribute msg)
greenBackground =
    [ Background.color <| rgb255 0 255 0 ]


blueBackground : List (Attribute msg)
blueBackground =
    [ Background.color <| rgb255 100 149 237 ]


aquaBackground : List (Attribute msg)
aquaBackground =
    [ Background.color <| rgb255 0 255 255 ]


thirtyPx : List (Attribute msg)
thirtyPx =
    [ height <| px 30 ]


sixtyPx : List (Attribute msg)
sixtyPx =
    [ height <| px 60 ]


footerStyle : List (Attribute msg)
footerStyle =
    widthFill ++ thirtyPx ++ greenBackground ++ centerX :: []


titleStyle : BaseModel -> List (Attribute msg)
titleStyle model =
    if model.authentication.authenticated then
        portion6 ++ blueBackground
    else
        widthFill ++ blueBackground


logoutStyle : List (Attribute msg)
logoutStyle =
    widthFill ++ aquaBackground