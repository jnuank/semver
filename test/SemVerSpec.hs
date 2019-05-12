module SemVerSpec (spec) where

import Test.Hspec
import SemVer

spec :: Spec
spec = do
    describe "お題1:文字列表現すること" $ do
        it "1,4,2を渡したら、1.4.2が返ってくる" $ do
            -- TODO: このJustを消したい
            (show $ makeVersion 1 4 2) `shouldBe` "Just 1.4.2"

    describe "お題2:等価性" $ do 
        it "1.4.2と2.1.0は等しくないこと" $ do 
            (makeVersion 1 4 2) `shouldNotBe` (makeVersion 2 1 0)
        it "1.4.2と1.4.2は等しい" $ do 
            (makeVersion 1 4 2) `shouldNotBe` (makeVersion 1 4 0)
    
    describe "お題3:負の整数" $ do 
        it "メジャーに-1を入れたらエラー" $ do 
            (makeVersion (-1) 4 2) `shouldBe` Nothing
        it "マイナーに-5を入れたらエラー" $ do 
            (makeVersion 2 (-5) 4) `shouldBe` Nothing
        it "パッチに-2を入れたらエラー" $ do 
            (makeVersion 2 2 (-2)) `shouldBe` Nothing
    