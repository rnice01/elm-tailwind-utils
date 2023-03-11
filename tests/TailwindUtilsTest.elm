module TailwindUtilsTest exposing (..)

import Expect as Expect
import TailwindUtils exposing (..)
import Test exposing (..)


suite : Test
suite =
    describe "Creating classes"
        [ test "Padding"
            (\_ ->
                twCss [ Padding Top ThreeRems, Padding TopBottom FourRems, Padding LeftRight FiveRems ]
                    |> Expect.equal "pt-3 py-4 px-5"
            )
        , test "Width"
            (\_ ->
                twCss [ Width FiftyPercent ]
                    |> Expect.equal "w-1/2"
            )
        , test "Multiple classes"
            (\_ ->
                twCss [ Padding TopBottom FiveRems, Width SeventyFivePercent ]
                    |> Expect.equal "py-5 w-3/4"
            )
        , test "Colors"
            (\_ ->
                twCss [ BackgroundColor Black OneHundred, BackgroundColor White Default ]
                    |> Expect.equal "bg-black-100 bg-white"
            )
        ]
