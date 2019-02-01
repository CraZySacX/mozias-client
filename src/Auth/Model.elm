module Auth.Model exposing (..)

import Http exposing (Error)
import Jwt exposing (JwtError)

type alias JwtPayload =
    { iss : String
    , sub : String
    , iat : Int
    , nbf : Int
    , exp : Int
    , aid : String
    , tfa : Bool
    }

type alias Authentication =
    { username : String
    , password : String
    , token : String
    , payload : JwtPayload
    , authenticated : Bool
    }

type AuthError
    = HttpError Http.Error
    | TokenError JwtError

defaultAuthentication : Authentication
defaultAuthentication =
    { username = ""
    , password = ""
    , token = ""
    , payload = defaultPayload
    , authenticated = False
    }


defaultPayload : JwtPayload
defaultPayload =
    { iss = ""
    , sub = ""
    , iat = 0
    , nbf = 0
    , exp = 0
    , aid = ""
    , tfa = False
    }