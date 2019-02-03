module Styles.Styles exposing (..)

import Base.Model exposing (Model)
import Element exposing
    ( Attribute
    , centerX
    , fill
    , fillPortion
    , height
    , px
    , rgb255
    , rgba255
    , width
    )
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font

----------
-- Top Level Styles
----------
headerStyle : List (Attribute msg)
headerStyle =
    widthFill ++ sixtyPx ++ redBackground


bodyStyle : List (Attribute msg)
bodyStyle =
    full ++ greyBackground ++ Font.size 48 :: []


footerStyle : List (Attribute msg)
footerStyle =
    widthFill ++ thirtyPx ++ greenBackground ++ centerX :: []


titleStyle : Model -> List (Attribute msg)
titleStyle model =
    if model.authentication.authenticated then
        portion6 ++ blueBackground
    else
        widthFill ++ blueBackground


logoutStyle : List (Attribute msg)
logoutStyle =
    widthFill ++ aquaBackground


authStyle : List (Attribute msg)
authStyle =
    heightFill ++ portion6 ++ greenBackgroundFiftyPercent ++ leftAndRight


----------
-- Typesetting
----------
h2 : List (Attribute msg)
h2 =
    Font.size 24 :: Font.bold :: []



----------
-- Fill
----------
heightFill : List (Attribute msg)
heightFill  =
    height fill :: []


widthFill : List (Attribute msg)
widthFill =
    width fill :: []


full : List (Attribute msg)
full =
    heightFill ++ widthFill


portion2 : List (Attribute msg)
portion2 =
    [ width <| fillPortion 2 ]


portion6 : List (Attribute msg)
portion6 =
    [ width <| fillPortion 6 ]


spacer : List (Attribute msg)
spacer =
    heightFill ++ portion2



----------
-- Background Colors
----------
redBackground : List (Attribute msg)
redBackground =
    [ Background.color <| rgb255 255 0 0 ]


greyBackground : List (Attribute msg)
greyBackground =
    [ Background.color <| rgb255 192 192 192 ]


greenBackground : List (Attribute msg)
greenBackground =
    [ Background.color <| rgb255 0 255 0 ]


greenBackgroundFiftyPercent : List (Attribute msg)
greenBackgroundFiftyPercent =
    [ Background.color <| rgba255 0 100 0 0.5 ]


blueBackground : List (Attribute msg)
blueBackground =
    [ Background.color <| rgb255 100 149 237 ]


aquaBackground : List (Attribute msg)
aquaBackground =
    [ Background.color <| rgb255 0 255 255 ]



----------
-- Width / Height
----------
thirtyPx : List (Attribute msg)
thirtyPx =
    [ height <| px 30 ]


sixtyPx : List (Attribute msg)
sixtyPx =
    [ height <| px 60 ]



----------
-- Borders
----------
leftAndRight : List (Attribute msg)
leftAndRight =
    [ Border.widthEach
        { bottom = 0
        , left = 1
        , right = 1
        , top = 0
        }
    ]