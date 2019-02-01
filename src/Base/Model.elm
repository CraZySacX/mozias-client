module Base.Model exposing (..)

import Auth.Model exposing (Authentication, defaultAuthentication)

type alias BaseModel =
    { quote : String
    , baseUrl: String
    , authentication: Authentication
    }

init: BaseModel
init =
    { quote = ""
    , baseUrl = "https://www.makenzieozias.com/api/v1"
    , authentication = defaultAuthentication
    }