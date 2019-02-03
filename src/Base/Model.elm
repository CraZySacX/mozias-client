module Base.Model exposing (init, Model, Page(..))

import Auth.Model exposing (Authentication, defaultAuthentication)
import Bootstrap.Modal as Modal
import Bootstrap.Navbar as Navbar
import Browser.Navigation as Navigation

type alias Model =
    { quote : String
    , baseUrl: String
    , authentication: Authentication
    , navKey : Navigation.Key
    , page : Page
    , navState : Navbar.State
    , modalVisibility : Modal.Visibility
    }

init: Navigation.Key -> Navbar.State -> Model
init key navState =
    { quote = ""
    , baseUrl = "https://www.makenzieozias.com/api/v1"
    , authentication = defaultAuthentication
    , page = Home
    , modalVisibility= Modal.hidden
    , navKey = key
    , navState = navState
    }

type Page
    = Home
    | GettingStarted
    | Modules
    | NotFound