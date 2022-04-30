module App exposing (main)

import Browser
import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)


main : Program String Model Msg
main =
    Browser.element
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }


type alias Model =
    { message : String
    }


init : String -> ( Model, Cmd Msg )
init flags =
    ( { message = flags }, Cmd.none )


type Msg
    = Name String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Name name ->
            ( { model | message = name }, Cmd.none )


view : Model -> Html Msg
view model =
    div []
        [ div [ class "text-3xl font-bold underline" ] [ text "Hello World" ]
        , div [ onClick (Name "Woooo") ] [ text model.message ]
        ]


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none
