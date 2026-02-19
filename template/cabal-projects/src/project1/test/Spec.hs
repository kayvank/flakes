module Main (main) where

import Test.Tasty
import Test.Tasty.Hspec
import Tests.NaiveSpecs qualified

main :: IO ()
main =
  testSpec "Project1 hspec tests " Tests.NaiveSpecs.specSuite >>= defaultMain
