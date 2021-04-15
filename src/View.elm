module View exposing (view)

import Element
    exposing
        ( Color
        , Element
        , alignBottom
        , alignLeft
        , alignRight
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
        , paragraph
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
import Html.Attributes exposing (align, src)
import Types exposing (Model, Msg(..))


white : Color
white =
    rgb255 255 255 255


black : Color
black =
    rgb255 0 0 0


blue : Color
blue =
    rgb255 189 85 15


pink : Color
pink =
    rgb255 250 250 250


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


viewSidebar : Model -> Element Msg
viewSidebar model =
    column
        [ Bg.color blue, width (px 250), padding 25, height fill ]
        [ column
            [ width fill
            , spacing 15
            ]
            [ but 0 model.activeButton "Trade"
            , but 1 model.activeButton "Deposit"
            , but 2 model.activeButton "Withdraw"
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
        [ --viewSidebar model
          viewDashboard model
        ]


hover =
    Element.mouseOver [ Element.alpha 0.7 ]


heebo =
    Font.family
        [ Font.typeface "Heebo"
        , Font.sansSerif
        ]


viewDashboard : Model -> Element Msg
viewDashboard model =
    column
        [ padding 30
        , width fill
        , height fill
        , Bg.image "colorroom.jpg"
        ]
        [ column
            [ Bg.color grey
            , centerX
            , spacing 40
            , padding 60
            , Border.shadow
                { blur = 3
                , color = blue
                , size = 2
                , offset = ( 2, 2 )
                }
            ]
            [ image
                [ Border.glow blue 2
                , centerX
                , height (px 200)
                , Border.rounded 100
                , Element.clip
                , width (px 200)
                ]
                { description = "", src = "/x.jpg" }
            , column
                [ Font.size 35
                , Font.extraBold
                , heebo
                ]
                [ text "Winslow", text "Bonnett" ]
            , column
                [ Font.size 20
                , Font.bold
                , Font.color black
                , spacing 5
                ]
                [ text "LOCATION"
                , Element.newTabLink
                    [ hover
                    , Font.size 17
                    , Font.color blue
                    , Font.italic
                    , Font.regular
                    ]
                    { label = text "Bridgetown, Barbados"
                    , url = "https://goo.gl/maps/E24WAqLWgNTj4xwm8"
                    }
                ]
            , row [ spacing 10, centerX ]
                [ Element.newTabLink []
                    { label =
                        Element.image [ width (px 50), hover ]
                            { description = "", src = "/instaLogo.png" }
                    , url = "https://www.instagram.com/winslowbonnett/"
                    }
                , Element.newTabLink []
                    { label =
                        Element.image [ width (px 38), hover ]
                            { description = "", src = "/githubicon.png" }
                    , url = "https://github.com/winslowbon"
                    }
                , Element.newTabLink []
                    { label =
                        Element.image [ width (px 120), hover ]
                            { description = "", src = "/binanceicon.png" }
                    , url = "https://www.binance.com/en/register?ref=YP85X8BC"
                    }
                ]
            ]
        ]
