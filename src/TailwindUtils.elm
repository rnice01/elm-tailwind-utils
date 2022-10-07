module TailwindUtils exposing (..)
import Test.Html.Selector exposing (class)

type Property =
    Padding Side Rems
    | Width Percentage
    | BackgroundColor Color Intensity

classFromProp : Property -> String
classFromProp prop =
    case prop of
        BackgroundColor color_ intensity -> bgColor color_ intensity
        Padding side_ rems_ -> padding side_ rems_
        Width w -> width w


twCss : List Property -> String
twCss props = String.join " " <| List.map classFromProp props

-- Padding --
padding : Side -> Rems -> String
padding side_ rems_ =
      String.join "" ["p", side side_, "-", remClass rems_]


--- Colors ---
type Intensity =
    Default
    | OneHundred
    | TwoHundred

type Color =
    Black
    | Blue
    | White


color : Color -> Intensity -> String
color color_ intensity =
    let
      colo = case color_ of
                Black -> "black"
                Blue -> "blue"
                White -> "white"
    in

    colo ++ intensityClass intensity

bgColor : Color -> Intensity -> String
bgColor color_ intensity =
    "bg-" ++ color color_ intensity


intensityClass : Intensity -> String
intensityClass intensity =
    case intensity of
        Default -> ""
        OneHundred -> "-100"
        TwoHundred -> "-200"


-- Dimensions --
dimension : Dimension -> String
dimension d =
  case d of
    Rems r -> remClass r
    Percent p -> ""

type Dimension =
    Rems Rems
    | Percent Percentage
  
type Rems =
    Point5Rems
    | OneRem
    | OneAndAHalfRems
    | TwoRems
    | TwoAndAHalfRems
    | ThreeRems
    | ThreeAndAHalfRems
    | FourRems
    | FiveRems
    | SixRems
    | SevenRems
    | EightRems
    | NineRems
    | TenRems


type Percentage =
  Auto
  | TwentyFivePercent
  | ThirtyThreePercent
  | FiftyPercent
  | SeventyFivePercent
  | OneHundredPercent

type Side =
    All
    | Bottom
    | Left
    | LeftRight
    | Right
    | Top
    | TopBottom

side : Side -> String
side s =
    case s of
      All -> ""
      Bottom -> "b"
      Left -> "l"
      LeftRight -> "x"
      Right -> "r"
      Top -> "t"
      TopBottom -> "y"

type Width =
    WidthPercent Percentage
    | WidthRems Rems

type Height =
    HeightPercent Percentage
    | HeightRems Rems


remClass : Rems -> String
remClass rems =
    case rems of
      Point5Rems -> "0.5"
      OneRem -> "1"
      OneAndAHalfRems -> "1.5"
      TwoRems -> "2"
      TwoAndAHalfRems -> "2.5"
      ThreeRems -> "3"
      ThreeAndAHalfRems -> "3.5"
      FourRems -> "4"
      FiveRems -> "5"
      _ -> ""

percentage : Percentage -> String
percentage percentage_ =
    case percentage_ of
        TwentyFivePercent -> "1/4"
        FiftyPercent -> "1/2"
        SeventyFivePercent -> "3/4"
        _ -> ""

width : Percentage -> String
width p = "w-" ++ percentage p

height : Height -> String
height height_ =
    case height_ of
      HeightPercent p -> percentage p
      HeightRems r -> remClass r


