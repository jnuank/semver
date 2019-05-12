module SemVer where

data Version = Version { major :: Int,  minor :: Int, patch :: Int } 

instance Show Version where
    show (Version major minor patch) = (show major) ++ "." ++ (show minor) ++ "." ++ (show patch)