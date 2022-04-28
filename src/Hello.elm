module Hello exposing (main)

import Browser
import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Message exposing (importableMessage)


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
    ( { message = "Hi, I'm compiled through vite-plugin-elm: " ++ flags }, Cmd.none )


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
        , div [] [ text importableMessage ]
        ]


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none
