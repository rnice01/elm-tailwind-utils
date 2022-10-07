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
          (twCss [Padding Top ThreeRems])
          |> Expect.equal "pt-3"
        )
      , test "Width"
        (\_ ->
          (twCss [Width FiftyPercent])
          |> Expect.equal "w-1/2"
        )
      , test "Multiple classes"
        (\_ ->
          (twCss [Padding TopBottom FiveRems, Width SeventyFivePercent])
          |> Expect.equal "py-5 w-3/4"
        )
      , test "Colors"
        (\_ ->
          (twCss [BackgroundColor Black OneHundred, BackgroundColor White Default])
          |> Expect.equal "bg-black-100 bg-white"
        )
      ]