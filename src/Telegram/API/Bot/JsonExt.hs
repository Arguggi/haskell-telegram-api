{-# LANGUAGE DataKinds         #-}
{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE DeriveAnyClass    #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeOperators     #-}
{-# LANGUAGE TemplateHaskell   #-}
{-# LANGUAGE FlexibleContexts  #-}

-- | This module contains helper functions to work with JSON
module Telegram.API.Bot.JsonExt
    (
      toJsonDrop,
      parseJsonDrop
    ) where

import           Data.Aeson
import           Data.Aeson.Types
import           GHC.Generics
import           GHC.TypeLits

-- |
toJsonDrop prefix = genericToJSON defaultOptions {
    fieldLabelModifier = drop prefix
  , omitNothingFields = True
  }

parseJsonDrop prefix = genericParseJSON defaultOptions { fieldLabelModifier = drop prefix }