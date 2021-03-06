module Views.UserInfo.Name exposing (name)

import Components.SpeechHeader exposing (speechHeader)
import Data.UserInfo exposing (isValidName)
import Helpers.Styles as Styles exposing (classes)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Model exposing (..)


name : Model -> Html Msg
name model =
    div []
        [ speechHeader "What shall we call you?"
        , div [ class "w-100 mw5 center" ] [ nameField model ]
        , handleNext model
        ]


nameField : Model -> Html Msg
nameField model =
    div [ class "flex items-center pa4" ]
        [ input
            [ class <| classes [ Styles.inputField, "tc w-100" ]
            , onInput SetName
            , autocomplete False
            , value <| Maybe.withDefault "" model.name
            ]
            []
        ]


handleNext : Model -> Html Msg
handleNext model =
    if isValidName model then
        button [ class Styles.buttonClear, onClick <| SetView Postcode ] [ text "Next" ]
    else
        button [ class Styles.buttonDisabled ] [ text "Next" ]
