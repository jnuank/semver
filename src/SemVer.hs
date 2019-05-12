module SemVer(makeVersion) where

data Version = Version { major :: Int,  minor :: Int, patch :: Int } deriving Eq

instance Show Version where
    show (Version major minor patch) = 
        (show major) ++ "." ++ (show minor) ++ "." ++ (show patch)

makeVersion :: Int -> Int -> Int -> Maybe (Version)
makeVersion ma mi pa 
    | ma < 0 || mi < 0 || pa < 0 = Nothing
    | otherwise                  = Just (Version ma mi pa)