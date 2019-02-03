module Page.Header exposing (headerRow)

import Auth.Messages exposing (InternalMsg(..))
import Base.Messages exposing (Msg(..))
import Base.Model exposing (Model)
import Element exposing
    ( centerX
    , column
    , el
    , Element
    , row
    , text
    )
import Element.Input as Input
import Styles.Styles exposing (headerStyle, titleStyle, logoutStyle)



----------
-- Header
----------
headerRow : Model -> Element Msg
headerRow model =
    row headerStyle [ titleColumn model, logoutColumn model ]


titleColumn : Model -> Element Msg
titleColumn model =
     column (titleStyle model) [ header ]


header : Element Msg
header =
    el [ centerX ] <| text <| "Title"


logoutColumn : Model -> Element Msg
logoutColumn model =
    if model.authentication.authenticated then
        column logoutStyle [ logout ]
    else
        Element.none


logout : Element Msg
logout =
    el [ centerX ] <| logoutButton


logoutButton : Element Msg
logoutButton =
    Input.button [ centerX ]
        { label = text "Logout"
        , onPress = Just <| AuthMsg Logout
        }