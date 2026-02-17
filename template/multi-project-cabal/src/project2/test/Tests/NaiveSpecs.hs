module Tests.NaiveSpecs where

import Test.Hspec (Spec, describe, it, shouldBe)

specSuite :: Spec
specSuite =
  describe "Project2 naive specs" $ do
    it "do something interesting" $ do
      "pass" `shouldBe` "pass"
