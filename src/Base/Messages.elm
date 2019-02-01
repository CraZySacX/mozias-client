module Base.Messages exposing (..)

import Auth.Messages exposing (InternalMsg)
import Auth.Model exposing(AuthError)

type BaseMsg
    = -- Parent to Child Messages
      AuthMsg Auth.Messages.InternalMsg
      -- Child to Parent Messages
    | AuthError Auth.Model.AuthError
    | AuthSuccess
    | GetQuote