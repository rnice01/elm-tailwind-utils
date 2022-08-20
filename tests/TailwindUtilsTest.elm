module TailwindUtilsTest exposing (..)

import Expect as Expect
import Test exposing (..)
import TailwindUtils exposing (..)


suite : Test
suite =
    describe "Creating classes"
    [
      test "Padding"
        (\_ ->
          (classFor [Padding Top ThreeRems])
          |> Expect.equal "pt-3"
        )
      , test "Width"
        (\_ ->
          (classFor [Width FiftyPercent])
          |> Expect.equal "w-1/2"
        )
      , test "Multiple classes"
        (\_ ->
          (classFor [Padding TopBottom FiveRems, Width SeventyFivePercent])
          |> Expect.equal "py-5 w-3/4"
        )
      ]