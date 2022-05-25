module App exposing (main)

import Browser exposing (Document)
import Html exposing (div, text)
import Html.Attributes
import Svg exposing (circle, defs, line, svg, symbol, use)
import Svg.Attributes exposing (cx, cy, fill, height, id, r, stroke, viewBox, width, x, x1, x2, xlinkHref, y, y1, y2)
import Svg.Events exposing (onMouseDown)


main : Program String Model Msg
main =
    Browser.document
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }


type alias Model =
    {}


init : String -> ( Model, Cmd Msg )
init _ =
    ( {}, Cmd.none )


type Msg
    = MouseDownToIcon String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        MouseDownToIcon id ->
            ( Debug.log id model, Cmd.none )


view : Model -> Document Msg
view _ =
    { title = "Sobyo"
    , body =
        [ div [ Html.Attributes.class "text-3xl font-bold underline" ] [ text "Hello World" ]
        , svg [ width "1000", height "500", Svg.Attributes.class "graph-sheet-background" ]
            [ defs []
                [ symbol [ id "actor", stroke "black", fill "white", viewBox "0 0 100 100" ]
                    [ circle [ cx "50", cy "20", r "15" ] []
                    , line [ x1 "25", y1 "45", x2 "75", y2 "45" ] []
                    , line [ x1 "50", y1 "35", x2 "50", y2 "70" ] []
                    , line [ x1 "50", y1 "70", x2 "25", y2 "90" ] []
                    , line [ x1 "50", y1 "70", x2 "75", y2 "90" ] []
                    ]
                ]
            , use
                [ id "actor1"
                , x "0"
                , y "0"
                , width "100"
                , height "100"
                , xlinkHref "#actor"
                , onMouseDown (MouseDownToIcon "actor1-mouseDown")
                ]
                []
            ]
        ]
    }


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none
