module TailwindUtils exposing (..)

type alias Properties = {
    padding: List Padding
    , width: Width
    , height: Height
    , backgroundColor: BackgroundColor
    }

classFromProperties : Properties -> String
classFromProperties props =
    let
      padding_ = String.join " " <| List.map classFor props.padding 
      bgColor_ = bgColor props.backgroundColor
    in
    String.join " " [padding_, bgColor_]


-- Padding --
type Padding = Padding Side Rems

classFor : Padding -> String
classFor (Padding side rems) =
    let
      side_ = case side of
        All -> "p-"
        Bottom -> "pb-"
        Left -> "pl-"
        LeftRight -> "px-"
        Right -> "pr-"
        Top -> "pt-"
        TopBottom -> "py-"
    in
    side_ ++ remClass rems


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

percentageClass : Percentage -> String
percentageClass percentage =
    case percentage of
        TwentyFivePercent -> "1/4"
        FiftyPercent -> "1/2"
        SeventyFivePercent -> "3/4"
        _ -> ""

width : Width -> String
width width_ =
    case width_ of
      WidthPercent p -> percentageClass p
      WidthRems r -> remClass r


height : Height -> String
height height_ =
    case height_ of
      HeightPercent p -> percentageClass p
      HeightRems r -> remClass r