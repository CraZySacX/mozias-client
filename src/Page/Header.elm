module Page.Header exposing (headerRow)

import Auth.Messages exposing (InternalMsg(..))
import Base.Messages exposing (BaseMsg(..))
import Base.Model exposing (BaseModel)
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
headerRow : BaseModel -> Element BaseMsg
headerRow model =
    row headerStyle [ titleColumn model, logoutColumn model ]


titleColumn : BaseModel -> Element BaseMsg
titleColumn model =
     column (titleStyle model) [ header ]


header : Element BaseMsg
header =
    el [ centerX ] <| text <| "Title"


logoutColumn : BaseModel -> Element BaseMsg
logoutColumn model =
    if model.authentication.authenticated then
        column logoutStyle [ logout ]
    else
        Element.none


logout : Element BaseMsg
logout =
    el [ centerX ] <| logoutButton


logoutButton : Element BaseMsg
logoutButton =
    Input.button [ centerX ]
        { label = text "Logout"
        , onPress = Just <| AuthMsg Logout
        }