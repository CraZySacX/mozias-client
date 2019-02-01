module Auth.View exposing (view)

import Auth.Messages exposing (..)
import Auth.Model exposing (Authentication)
import Pages.Common exposing (h2)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Input as Input

headingRow : Element Msg
headingRow =
    row [ width fill, padding 10 ] [ loginHeading ]

loginHeading : Element Msg
loginHeading =
    el (List.append h2 [ centerX ]) (Element.text "Login")

buttonRow : Element Msg
buttonRow =
    row [ width fill, padding 10 ] [ usernameInput, passwordInput, loginButton ]

usernameInput : Element Msg
usernameInput =
    Input.username []
        { onChange = ForSelf << SetUsername
        , text = "username"
        , placeholder = Nothing
        , label = Input.labelLeft [] (Element.text "username")
        }

passwordInput : Element Msg
passwordInput =
    Input.newPassword []
        { onChange = ForSelf << SetPassword
        , text = "password"
        , placeholder = Nothing
        , label = Input.labelLeft [] (Element.text "password")
        , show = False
        }

loginButton : Element Msg
loginButton =
    Input.button [ centerX ]
        { label = text "Login"
        , onPress = Just (ForSelf Login)
        }

view : Authentication -> Element Msg
view model =
    column [ width fill ]
        [ headingRow
        , buttonRow
        ]