module GitHub.Corners where

import CSS (Transformation(..), absolute, color, fromString, left, nil, offset, position, px, right, top, transform, transformOrigin)
import CSS (key) as C
import CSS.Color (Color, fromInt, white)
import CSS.Render (render, renderedInline)
import Data.Maybe (fromMaybe)
import Prelude hiding (top)
import Text.Smolder.HTML (a, style)
import Text.Smolder.HTML.Attributes (className, height, href, width)
import Text.Smolder.HTML.Attributes (style) as A
import Text.Smolder.Markup (Markup, attribute, empty, text, (!))
import Text.Smolder.SVG (path, svg)
import Text.Smolder.SVG.Attributes (d, viewBox)
import Text.Smolder.SVG.Attributes (fill) as A


type URL = String

type BackgroundColor = Color

type OctocatColor = Color

data Position = TopLeft
              | TopRight

defaultCorner :: forall e. URL -> Markup e
defaultCorner u = corner u black white TopRight

corner :: forall e. URL -> BackgroundColor -> OctocatColor -> Position -> Markup e
corner u bc oc p = a ! key "purescript-github-corner-toplevel"
    ! href u
    ! className "github-corner"
    ! attribute "aria-label" "View source on Github"
    $ do
        svg ! key "0"
            ! width "80"
            ! height "80"
            ! viewBox "0 0 250 250"
            ! styleAttribute do
                fill bc
                color oc
                position absolute
                top nil
                border nil
                case p of
                    TopLeft  -> do
                        left nil
                        transform $ Transformation $ fromString "scale(-1, 1)"
                    TopRight -> right nil
            ! attribute "aria-hidden" "true"
            $ do
                path ! key "0"
                    ! d "M0,0 L115,115 L130,115 L142,142 L250,250 L250,0 Z"
                    $ empty
                path ! key "1"
                    ! d "M128.3,109.0 C113.8,99.7 119.0,89.6 119.0,89.6 C122.0,82.7 120.5,78.6 120.5,78.6 C119.2,72.0 123.4,76.3 123.4,76.3 C127.3,80.9 125.5,87.3 125.5,87.3 C122.9,97.6 130.6,101.9 134.4,103.2"
                    ! A.fill "currentColor"
                    ! styleAttribute do
                        transformOrigin
                            (offset $ px 130.0) (offset $ px 106.0) nil
                    ! className "octo-arm"
                    $ empty
                path ! key "2"
                    ! d "M115.0,115.0 C114.9,115.1 118.7,116.5 119.8,115.4 L133.7,101.6 C136.9,99.2 139.9,98.4 142.2,98.6 C133.8,88.0 127.5,74.4 143.8,58.0 C148.5,53.4 154.0,51.2 159.7,51.0 C160.3,49.4 163.2,43.6 171.4,40.1 C171.4,40.1 176.1,42.5 178.8,56.2 C183.1,58.6 187.2,61.8 190.9,65.4 C194.5,69.0 197.7,73.2 200.1,77.6 C213.8,80.2 216.3,84.9 216.3,84.9 C212.7,93.1 206.9,96.0 205.4,96.6 C205.1,102.4 203.0,107.8 198.3,112.5 C181.9,128.9 168.3,122.5 157.7,114.1 C157.9,116.9 156.7,120.9 152.7,124.9 L141.0,136.5 C139.8,137.7 141.6,141.9 141.8,141.8 Z"
                    ! A.fill "currentColor"
                    ! className "octo-body"
                    $ empty
        style ! key "1"
            $ text ".github-corner:hover .octo-arm{animation:octocat-wave 560ms ease-in-out}@keyframes octocat-wave{0%,100%{transform:rotate(0)}20%,60%{transform:rotate(-25deg)}40%,80%{transform:rotate(10deg)}}@media (max-width:500px){.github-corner:hover .octo-arm{animation:none}.github-corner .octo-arm{animation:octocat-wave 560ms ease-in-out}}"
  where
    styleAttribute = A.style <<< fromMaybe "" <<< renderedInline <<< render
    fill = C.key $ fromString "fill"
    border = C.key $ fromString "border"
    key = attribute "key"

black :: Color
black = fromInt 0x151513

green :: Color
green = fromInt 0x64CEAA

red :: Color
red = fromInt 0xFD6C6C

blue :: Color
blue = fromInt 0x70B7FD
