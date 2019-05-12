module SemVerSpec (spec) where

import Test.Hspec
import SemVer

spec :: Spec
spec = do
    describe "お題1:文字列表現すること" $ do
        it "1,4,2を渡したら、1.4.2が返ってくる" $ do
            (show $ Version 1 4 2) `shouldBe` "1.4.2"

    describe "お題2:等価性" $ do 
        it "1.4.2と2.1.0は等しくないこと" $ do 
            (Version 1 4 2) `shouldNotBe` (Version 2 1 0)
        it "1.4.2と1.4.2は等しい" $ do 
            (Version 1 4 2) `shouldNotBe` (Version 1 4 0)

