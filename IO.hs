import System.Directory
import System.IO

--0
ls :: FilePath -> IO ()
ls filePath = do
  files <- listDirectory filePath
  putStrLn $ unlines files

--1
printFile :: FilePath -> IO ()
printFile fileToPrint = do
  content <- readFile fileToPrint
  print content

--2
areEqualText :: FilePath -> FilePath -> IO (Bool)
areEqualText filePath1 filePath2 = do
  content1 <- readFile filePath1
  content2 <- readFile filePath2

  if (content1 == content2) then return True else return False
  
--3
