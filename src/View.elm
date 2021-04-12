module View exposing (view)

import Element
    exposing
        ( Color
        , Element
        , alignBottom
        , alignTop
        , centerX
        , centerY
        , column
        , el
        , fill
        , height
        , none
        , padding
        , px
        , rgb255
        , row
        , spaceEvenly
        , spacing
        , text
        , width
        )
import Element.Background as Bg
import Element.Border as Border
import Element.Font as Font exposing (Font)
import Element.Input as Inp
import Html exposing (Html)
import Types exposing (Model, Msg)


blue : Color
blue =
    rgb255 37 104 186


pink : Color
pink =
    rgb255 169 145 171


grey : Color
grey =
    rgb255 217 217 217


but : String -> Element Msg
but buttonName =
    Inp.button [ Bg.color grey, width fill, height (px 50), Border.rounded 15 ]
        { label = text buttonName, onPress = Nothing }


viewsidebar =
    column
        [ Bg.color blue, width (px 250), padding 25, height fill ]
        [ column
            [ width fill
            , spacing 15
            ]
            [ but "sue"
            , but "mary"
            , but "taliyah"
            ]
        , Element.newTabLink
            [ Font.size 25, Font.bold, alignBottom, centerX ]
            { label = text "By Winslow", url = "https://www.instagram.com/winslowbonnett" }
        ]


view : Model -> Html Msg
view model =
    viewBody model
        |> Element.layout
            [ width fill
            , height fill
            ]


viewBody : Model -> Element Msg
viewBody _ =
    row
        [ height fill
        , width fill
        , Font.size 35
        , Font.extraBold
        , Font.center
        , spaceEvenly
        , Border.rounded 15
        ]
        [ viewsidebar
        , el [ width fill, height fill, Bg.color pink, padding 25 ] (text "Dashboard")
        ]
