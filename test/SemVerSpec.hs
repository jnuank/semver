module SemVerSpec (spec) where

import Test.Hspec
import SemVer

spec :: Spec
spec = do
  describe "お題1:文字列表現すること" $ do
    it "1,4,2を渡したら、1.4.2が返ってくる" $ do
        let result = show $ Version 1 4 2
        result `shouldBe` "1.4.2"
