module SemVer (
    makeVersion,
    bumpPatch,
    bumpMinor,
    bumpMajor
    ) where

data Version = Version { major :: Int,  minor :: Int, patch :: Int } deriving Eq

instance Show Version where
    show (Version major minor patch) = 
        (show major) ++ "." ++ (show minor) ++ "." ++ (show patch)

makeVersion :: Int -> Int -> Int -> Maybe (Version)
makeVersion ma mi pa 
    | ma < 0 || mi < 0 || pa < 0 = Nothing
    | otherwise                  = Just (Version ma mi pa)

bumpPatch :: Version -> Maybe Version
bumpPatch (Version major minor patch) = Just (Version major minor (patch+1) )

bumpMinor :: Version -> Maybe Version
bumpMinor (Version major minor _) = Just (Version major (minor+1) 0 )

bumpMajor :: Version -> Maybe Version
bumpMajor (Version major _ _) = Just (Version (major+1) 0 0 )