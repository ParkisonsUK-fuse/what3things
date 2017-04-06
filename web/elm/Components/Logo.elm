module Components.Logo exposing (logo)

import Html exposing (..)
import Html.Attributes exposing (..)
import Model exposing (..)


logo : Html Msg
logo =
    div [ class "w5 center" ]
        [ img
            [ src "/images/puk-logo.jpg"
            , class "w-100 shadow-1"
            , style [ ( "transform", "translateY(-10px) rotateZ(-3deg)" ) ]
            ]
            []
        ]