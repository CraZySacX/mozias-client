module Base.Messages exposing (Msg(..))

import Auth.Messages exposing (InternalMsg)
import Auth.Model exposing(AuthError)
import Bootstrap.Navbar as Navbar
import Browser exposing (UrlRequest)
import Url exposing (Url)

type Msg
    = -- Parent to Child Messages
      AuthMsg Auth.Messages.InternalMsg
      -- Child to Parent Messages
    | AuthError Auth.Model.AuthError
    | AuthSuccess
    | GetQuote
    | UrlChange Url
    | ClickedLink UrlRequest
    | NavMsg Navbar.State
    | CloseModal
    | ShowModal