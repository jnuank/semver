{-# LANGUAGE QuasiQuotes #-}

module SemVer
    ( Version
    , makeVersion
    , bumpPatch
    , bumpMinor
    , bumpMajor
    )
where

import           Data.List
import           Data.String.Interpolate

data Version = Version { major :: Int,  minor :: Int, patch :: Int } deriving (Eq, Ord)

instance Show Version where
    -- intercalate "." ["1","2","3"]　→　"1.2.3"
    show (Version major minor patch) = [i|#{major}.#{minor}.#{patch}|]

makeVersion :: Int -> Int -> Int -> Maybe Version
makeVersion major minor patch | major < 0 || minor < 0 || patch < 0 = Nothing
                              | otherwise = Just (Version major minor patch)

bumpPatch :: Version -> Version
bumpPatch (Version major minor patch) = Version major minor (patch + 1)

bumpMinor :: Version -> Version
bumpMinor (Version major minor _) = Version major (minor + 1) 0

bumpMajor :: Version -> Version
bumpMajor (Version major _ _) = Version (major + 1) 0 0
