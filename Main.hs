import Network.HTTP.Types
import Network.Wai
import Network.Wai.Handler.Warp
import System.Environment

app :: Application
app _ respond =
    respond $
      responseLBS status200
        [("Content-Type", "text/plain")]
        "Hello, world!"

main :: IO ()
main = do
    env <- getEnvironment
    let port = maybe 8080 read $ lookup "PORT" env
    run port app
