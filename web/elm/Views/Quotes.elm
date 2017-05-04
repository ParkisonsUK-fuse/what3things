module Views.Quotes exposing (..)

import Components.QuoteBubble exposing (cycleQuoteBackground, quoteBubble)
import Dict
import Helpers.Styles as Styles exposing (classes)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Model exposing (..)


quotes : Model -> Html Msg
quotes model =
    div [ class "center mw6 mt4" ]
        [ p [ class "grey" ] [ text <| renderQuoteNumber model ]
        , renderQuoteBubble model
        , button
            [ class <| classes [ Styles.buttonClear, "ma3 relative z-3" ]
            , onClick <| SubmitAnswer Yes
            ]
            [ text "Yes, I feel like this" ]
        , button
            [ class <| classes [ Styles.buttonClear, "relative z-3" ]
            , onClick <| SubmitAnswer No
            ]
            [ text "No, not how I feel" ]
        ]


renderQuoteBubble : Model -> Html Msg
renderQuoteBubble model =
    quoteBubble
        (getQuoteBody model)
        "pa5-ns"
        (model |> quoteNumber |> cycleQuoteBackground)


renderQuoteNumber : Model -> String
renderQuoteNumber model =
    let
        current =
            quoteNumber model

        total =
            Dict.size model.quotes
    in
        (toString current) ++ " of " ++ (toString total)


quoteNumber : Model -> Int
quoteNumber model =
    let
        total =
            Dict.size model.quotes
    in
        total - (model.remainingQuotes |> Maybe.withDefault [] |> List.length)


getQuoteBody : Model -> String
getQuoteBody model =
    model.currentQuote
        |> Maybe.andThen (\x -> Dict.get x model.quotes)
        |> Maybe.withDefault ""
