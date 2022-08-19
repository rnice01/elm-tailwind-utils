module TailwindUtilsTest exposing (..)

import Expect as Expect
import Test exposing (..)
import TailwindUtils exposing (..)


suite : Test
suite =
    test "Creating Padding"
        (\_ ->
          (classFor <| Padding Top ThreeRems)
          |> Expect.equal "pt-3"
        )