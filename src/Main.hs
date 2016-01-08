{-# LANGUAGE OverloadedStrings #-}

module Main where

import Network.Wai
import Network.Wai.Handler.Warp (run)
import Network.HTTP.Types

main :: IO ()
main = run 3000 app

app :: Application
app request respond = respond $ case rawPathInfo request of
  "/"     -> index
  _       -> notFound

index :: Response
index = responseLBS
  status200
  [("Content-Type", "text/plain")]
  "Hello web!"

notFound :: Response
notFound = responseLBS
  status404
  [("Content-Type", "text/plain")]
  "404 - Not Found"

