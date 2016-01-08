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
  "/raw/" -> plainIndex
  _       -> notFound

index :: Response
index = responseFile
  status200
  [("Content-Type", "text/html")]
  "index.html"
  Nothing

plainIndex :: Response
plainIndex = responseFile
  status200
  [("Content-Type", "text/plain")]
  "index.html"
  Nothing

notFound :: Response
notFound = responseLBS
  status404
  [("Content-Type", "text/plain")]
  "404 - Not Found"

