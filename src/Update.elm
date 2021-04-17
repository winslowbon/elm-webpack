module Update exposing (update)

import Types exposing (Model, Msg(..))


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Click ->
            ( model, Cmd.none )

        ChangeActiveButton newbuttonId ->
            let
                newModel =
                    { model | activeButton = newbuttonId }
            in
            ( newModel, Cmd.none )
