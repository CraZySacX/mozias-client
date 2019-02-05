module Page.Auth exposing (pageAuth)

import Auth.Messages exposing (Msg(..), InternalMsg(..))
import Base.Model exposing (Model)
import Bootstrap.Button as Button
import Bootstrap.Form as Form
import Bootstrap.Form.InputGroup as InputGroup
import Bootstrap.Form.Input as Input
import Bootstrap.Grid.Col as Col
import Bootstrap.Grid.Row as Row
import Bootstrap.Text as Text
import Bootstrap.Utilities.Flex as Flex
import Html exposing (br, h1, Html, text)
import Html.Attributes exposing (class, for, id)


----------
-- Auth Form
----------
pageAuth : Model -> List (Html Msg)
pageAuth model =
    [ h1 [] [ text "Login" ] , authForm model ]


authForm : Model -> Html Msg
authForm model =
    Form.form []
        [ Form.group []
            [ Form.label [ for "emailAddress" ] [ text "Email" ]
            , InputGroup.config
                ( InputGroup.text [ Input.placeholder "johndoe@gmail.com", Input.onInput <| ForSelf << SetUsername ] )
                |> InputGroup.attrs [ id "emailAddress" ]
                |> InputGroup.view
            , Form.help [] [ text "We'll never share your email with anyone else." ]
            ]
        , Form.group []
            [ Form.label [ for "password" ] [ text "Password" ]
            , InputGroup.config
                ( InputGroup.password [ Input.placeholder "s3cr3t" ] )
                |> InputGroup.attrs [ id "password" ]
                |> InputGroup.successors
                    [ InputGroup.button [ Button.primary ] [ text "Login!"] ]
                |> InputGroup.view
            ]
        ]

----------
-- Old Auth Form
----------
-- authForm : Authentication -> Element Msg
-- authForm _ =
--     row full
--         [ column spacer [ Element.none ]
--         , column authStyle [ formCol ]
--         , column spacer [ Element.none ]
--         ]


-- formCol : Element Msg
-- formCol =
--     column full
--         [ usernameInput
--         , passwordInput
--         , loginButton
--         ]


-- usernameInput : Element Msg
-- usernameInput =
--     Input.username []
--         { onChange = ForSelf << SetUsername
--         , text = "username"
--         , placeholder = Nothing
--         , label = Input.labelLeft [] (Element.text "username")
--         }


-- passwordInput : Element Msg
-- passwordInput =
--     Input.newPassword []
--         { onChange = ForSelf << SetPassword
--         , text = "password"
--         , placeholder = Nothing
--         , label = Input.labelLeft [] (Element.text "password")
--         , show = False
--         }

-- loginButton : Element Msg
-- loginButton =
--     Input.button [ centerX ]
--         { label = text "Login"
--         , onPress = Just (ForSelf Login)
--         }