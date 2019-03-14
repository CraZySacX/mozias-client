module Page.Menu exposing (menu)

import Base.Model exposing (Model)
import Base.Messages exposing (Msg(..), AuthMsg(..))
import Bootstrap.Button as Button
import Bootstrap.Navbar as Navbar
import Html exposing (Html, text)
import Html.Attributes exposing (href)

menu : Model -> Html Msg
menu model =
    Navbar.config NavMsg
        |> Navbar.withAnimation
        |> Navbar.container
        |> Navbar.brand [ href "#" ] [ text "Makenzie Ozias" ]
        |> Navbar.items
            [ Navbar.itemLink [ href "#art" ] [ text "Art" ]
            , Navbar.itemLink [ href "#writing" ] [ text "Writing" ]
            ]
        |> Navbar.customItems
            [
                if model.authentication.authenticated then
                    Navbar.customItem <| Button.button [ Button.primary, Button.onClick <| AuthMsg Logout ] [ text "Logout" ]
                else
                    Navbar.customItem <| text ""
            ]
        |> Navbar.view model.navState