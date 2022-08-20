module TailwindUtils exposing (..)

type Property =
    Padding Side Rems
    | Width Percentage

classFromProp : Property -> String
classFromProp prop =
    case prop of
        Padding side_ rems_ -> padding side_ rems_
        Width w -> width w


classFor : List Property -> String
classFor props = String.join " " <| List.map classFromProp props

-- Padding --
padding : Side -> Rems -> String
padding side_ rems_ =
      String.join "" ["p", side side_, "-", remClass rems_]


--- Colors ---
type Intensity =
    OneHundred
    | TwoHundred

type Color =
    Blue Intensity


type BackgroundColor = BackgroundColor Color

color : Color -> String
color color_ =
    case color_ of
        Blue intensity -> "blue-" ++ intensityClass intensity

bgColor : BackgroundColor -> String
bgColor (BackgroundColor color_) =
    "bg" ++ color color_


intensityClass : Intensity -> String
intensityClass intensity =
    case intensity of
        OneHundred -> "100"
        TwoHundred -> "200"


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