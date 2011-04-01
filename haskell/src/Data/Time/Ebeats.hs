{-# LANGUAGE BangPatterns #-}

module Data.Time.Ebeats
  ( EbeatsTime(..)
  , getEbeatsTime
  , toEbeatsTime
  )
  where

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

import           Data.Fixed          (Fixed, E2)
import           Data.Time           (UTCTime(..), getCurrentTime)
import           Data.Time.LocalTime (TimeOfDay(..), timeToTimeOfDay)

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

newtype EbeatsTime = EbeatsTime { ebeatsTimeValue :: Fixed E2 }
  deriving (Eq, Ord)

instance Show EbeatsTime where
  show = ('@':) . show . ebeatsTimeValue

getEbeatsTime :: IO EbeatsTime
getEbeatsTime = toEbeatsTime `fmap` getCurrentTime

toEbeatsTime :: UTCTime -> EbeatsTime
toEbeatsTime utct =
    let TimeOfDay h m s = timeToTimeOfDay $ utctDayTime utct
        !ebeats         = realToFrac $ s * 5/432 + realToFrac m * 25/36 + realToFrac h * 125/3
    in EbeatsTime ebeats

