module SemVerSpec (spec) where

import Test.Hspec
import SemVer

spec :: Spec
spec = do
    describe "お題1:文字列表現すること" $ do
        it "1,4,2を渡したら、1.4.2が返ってくる" $ do
            let result = show $ Version 1 4 2
            result `shouldBe` "1.4.2"

    describe "お題2:等価性" $ do 
        it "1.4.2と2.1.0は等しくないこと" $ do 
            let result = Version 1 4 2
            let expect = Version 2 1 0
            result `shouldNotBe` expect
        it "1.4.2と1.4.2は等しい" $ do 
            let result = Version 1 4 2
            let expect = Version 1 4 2
            result `shouldBe` expect
