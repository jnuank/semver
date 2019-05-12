module SemVer where

data Version = Version { major :: Int,  minor :: Int, patch :: Int } deriving Eq

instance Show Version where
    show (Version major minor patch) = (show major) ++ "." ++ (show minor) ++ "." ++ (show patch)