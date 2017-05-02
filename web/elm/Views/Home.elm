module Views.Home exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Components.SpeechHeader exposing (speechHeader)
import Helpers.Styles as Styles
import Model exposing (..)


home : Model -> Html Msg
home model =
    div []
        [ speechHeader "Wondering what happens next?"
        , div [ class "mw6 center" ]
            [ h2 [ class "ph3" ] [ text "We know that being diagnosed with Parkinson's can feel confusing and overwhelming. But there's lots of information and support out there, and we're here to help find what's right for you, right now." ]
            , h2 [ class "ph3" ] [ text "[Name] is simple and easy to use, and at the end you'll have a list of next steps that we recommend you try. If you're a loved one of someone with Parkinson's, go grab them as they'll get the best results if they take the controls." ]
            , button [ class Styles.buttonClear, onClick <| SetView Name ] [ text "Let's get started" ]
            ]
        ]
