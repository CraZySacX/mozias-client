module Base.Subs exposing (..)

import Base.Messages exposing (Msg(..))
import Base.Model exposing (Model)
import Bootstrap.Navbar as Navbar


subscriptions : Model -> Sub Msg
subscriptions model =
    Navbar.subscriptions model.navState NavMsg