module SemVer (
    makeVersion,
    bumpPatch,
    bumpMinor,
    bumpMajor
    ) where

data Version = Version { major :: Int,  minor :: Int, patch :: Int } deriving (Eq, Ord)

instance Show Version where
    show (Version major minor patch) = 
        (show major) ++ "." ++ (show minor) ++ "." ++ (show patch)

makeVersion :: Int -> Int -> Int -> Maybe (Version)
makeVersion major minor patch 
    | major < 0 || minor < 0 || patch < 0   = Nothing
    | otherwise                             = Just (Version major minor patch)

bumpPatch :: Version -> Maybe Version
bumpPatch (Version major minor patch) = Just (Version major minor (patch+1) )

bumpMinor :: Version -> Maybe Version
bumpMinor (Version major minor _) = Just (Version major (minor+1) 0 )

bumpMajor :: Version -> Maybe Version
bumpMajor (Version major _ _) = Just (Version (major+1) 0 0 )