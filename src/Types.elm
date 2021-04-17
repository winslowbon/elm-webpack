module Types exposing (Flags, Model, Msg(..))


type alias Model =
    { activeButton : Int }


type alias Flags =
    {}


type Msg
    = Click
    | ChangeActiveButton Int
