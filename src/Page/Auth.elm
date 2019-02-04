module Page.Auth exposing (pageAuth)

import Base.Messages exposing (Msg)
import Base.Model exposing (Model)
import Bootstrap.Form as Form
import Bootstrap.Form.InputGroup as InputGroup
import Bootstrap.Form.Input as Input
import Html exposing (br, h1, Html, text)


----------
-- Auth Form
----------
pageAuth : Model -> List (Html Msg)
pageAuth model =
    [ h1 [] [ text "Login" ] , authForm model ]


authForm : Model -> Html Msg
authForm _ =
    Form.form [] []


-- , InputGroup.config
--             (InputGroup.text [ Input.placeholder "username"])
--             |> InputGroup.predecessors
--                 [ InputGroup.span [] [ text "@"] ]
--             |> InputGroup.view
--         , br [] []
--         , InputGroup.config
--             (InputGroup.text [ Input.placeholder "amount"])
--             |> InputGroup.predecessors
--                 [ InputGroup.span [] [ text "$"] ]
--             |> InputGroup.successors
--                 [ InputGroup.span [] [ text ".00"] ]
--             |> InputGroup.view

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