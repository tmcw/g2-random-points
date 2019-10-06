module Example exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import GeoJson exposing (GeoJsonObject(..))
import GeoJsonRandom exposing (randomPoints)
import Test exposing (..)


suite : Test
suite =
    describe "GeoJsonRandom"
        [ describe "randomPoints"
            [ test "generates an empty FeatureCollection with 0" <|
                \_ ->
                    let
                        fc =
                            randomPoints 0
                    in
                    Expect.equal fc (FeatureCollection [])
            , test "generates a single-feature FeatureCollection" <|
                \_ ->
                    let
                        fc =
                            randomPoints 1
                    in
                    case fc of
                        FeatureCollection features ->
                            Expect.equal (List.length features) 1

                        Geometry _ ->
                            Expect.fail "Output must be a FeatureCollection"

                        Feature _ ->
                            Expect.fail "Output must be a FeatureCollection"
            ]
        ]
