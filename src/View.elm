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
        , image
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
import Element.Background as Bg exposing (color)
import Element.Border as Border
import Element.Font as Font exposing (Font)
import Element.Input as Inp
import Html exposing (Html)
import Html.Attributes exposing (src)
import Types exposing (Model, Msg(..))


blue : Color
blue =
    rgb255 37 104 186


pink : Color
pink =
    rgb255 169 145 171


grey : Color
grey =
    rgb255 217 217 217


but : Int -> Int -> String -> Element Msg
but buttonId activeButton buttonName =
    let
        color =
            if buttonId == activeButton then
                pink

            else
                grey
    in
    Inp.button [ Bg.color color, width fill, height (px 50), Border.rounded 15 ]
        { label = text buttonName, onPress = Just (ChangeActiveButton buttonId) }


viewsidebar : Model -> Element Msg
viewsidebar model =
    column
        [ Bg.color blue, width (px 250), padding 25, height fill ]
        [ column
            [ width fill
            , spacing 15
            ]
            [ but 0 model.activeButton "sue"
            , but 1 model.activeButton "mary"
            , but 2 model.activeButton "taliyah"
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
viewBody model =
    row
        [ height fill
        , width fill
        , Font.size 35
        , Font.extraBold
        , Font.center
        , spaceEvenly
        , Border.rounded 15
        ]
        [ viewsidebar model
        , viewDashboard model
        ]


viewDashboard : Model -> Element Msg
viewDashboard model =
    column [ Bg.color pink, padding 25, width fill, height fill ]
        [ el [ Font.size 35, Font.extraBold, centerX ] (text "DASHBOARD")
        , image [ centerX, width (Element.px 300), alignBottom ]
            { description = "", src = "/rooftop.jpg" }
        ]
