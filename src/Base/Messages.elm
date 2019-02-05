module Base.Messages exposing (Msg(..), AuthMsg(..))

import Auth.Model exposing(AuthError, JwtPayload)
import Bootstrap.Navbar as Navbar
import Browser exposing (UrlRequest)
import Http exposing (Error)
import Jwt exposing (JwtError)
import Url exposing (Url)

type Msg
    = -- Parent to Child Messages
      AuthMsg AuthMsg
      -- Child to Parent Messages
    | GetQuote
    | UrlChange Url
    | ClickedLink UrlRequest
    | NavMsg Navbar.State
    | CloseModal
    | ShowModal

type AuthMsg
    = Login
    | Logout
    | SetPassword String
    | SetUsername String
    | AuthUserResult (Result Http.Error String)
    | DecodeResult (Result JwtError JwtPayload)
    | Authenticated Bool