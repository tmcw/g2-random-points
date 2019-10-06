module GeoJsonRandom exposing (randomPoints)

import GeoJson exposing (FeatureObject, GeoJsonObject(..), Geometry(..), Position)
import Json.Encode


emptyObject : Json.Encode.Value
emptyObject =
    Json.Encode.object []


randomPoints : Int -> GeoJsonObject
randomPoints count =
    FeatureCollection
        (List.repeat
            count
            (FeatureObject
                (Just
                    (Point ( 0, 0, 0 ))
                )
                emptyObject
                Nothing
            )
        )
