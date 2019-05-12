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

    describe "お題4:バージョンアップ" $ do 
        it "下位互換性のあるバグ修正の場合、パッチを更新する" $ do 
            let actual = makeVersion 1 2 1 
            (actual >>= bumpPatch) `shouldBe` (makeVersion 1 2 2)

        it "下位互換性のある機能追加の場合、マイナーを更新して、パッチを0にする" $ do 
            let actual = makeVersion 1 2 1 
            (actual >>= bumpMinor) `shouldBe` (makeVersion 1 3 0)

        it "下位互換性を壊す場合は、メジャーを更新して、マイナーとパッチを0にする" $ do 
            let actual = makeVersion 1 2 1 
            (actual >>= bumpMajor) `shouldBe` (makeVersion 2 0 0)