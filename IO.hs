import System.Directory
import System.IO
import qualified Data.Text as T
import qualified Data.ByteString as B

--0
ls :: FilePath -> IO [FilePath]
ls filePath = do
  files <- listDirectory filePath
  return files

--1
printFile :: FilePath -> IO ()
printFile fileToPrint = do
  content <- readFile fileToPrint
  print content

printFile' :: FilePath -> IO()
printFile' fileToPrint = do
  handle <- openFile fileToPrint ReadMode
  content <- hGetContents handle 
  hClose handle
  print content

--2
areEqualText :: FilePath -> FilePath -> IO Bool
areEqualText filePath1 filePath2 = do
  content1 <- readFile filePath1
  content2 <- readFile filePath2

  if content1 == content2 then return True else return False

areEqualText' :: FilePath -> FilePath -> IO Bool
areEqualText' filePath1 filePath2 = do
  handle1 <- openFile filePath1 ReadMode
  handle2 <- openFile filePath2 ReadMode
  content1 <- hGetContents handle1
  content2 <- hGetContents handle2
  hClose handle1
  hClose handle2
  --if content1 == content2 then return True else return False
  return $ content1 == content2
  
--3
dos2unix :: FilePath -> FilePath -> IO ()
dos2unix fileToRead fileToWrite = do
  read_handle <- openFile fileToRead ReadMode
  write_handle <- openFile fileToWrite WriteMode
  replaceEndings read_handle write_handle
  hClose read_handle
  hClose write_handle
  where replaceEndings read_handle write_handle = do
                line <- hGetLine read_handle
                if not (null line) then do
                  hPutStrLn write_handle (T.unpack (T.replace (T.pack "\r\n") (T.pack "\n") (T.pack line)))
                  replaceEndings read_handle write_handle
                else return ()
                
                          
unix2dos :: FilePath -> FilePath -> IO ()
unix2dos fileToRead fileToWrite = do
  read_handle <- openFile fileToRead ReadMode
  write_handle <- openFile fileToWrite WriteMode
  replaceEndings read_handle write_handle
  hClose read_handle
  hClose write_handle
  where replaceEndings read_handle write_handle = do
                line <- hGetLine read_handle
                if not (null line) then do
                  hPutStrLn write_handle (T.unpack (T.replace (T.pack "\n") (T.pack "\r\n") (T.pack line)))
                  replaceEndings read_handle write_handle
                else return ()

--4
areEqualBin :: FilePath -> FilePath -> IO (Bool)
areEqualBin filePath1 filePath2 = do
  handle1 <- openFile filePath1 ReadMode
  handle2 <- openFile filePath2 ReadMode
  content1 <- B.hGetContents handle1
  content2 <- B.hGetContents handle2
  hClose handle1
  hClose handle2
  return $ content1 == content2

--5
fileIsBeingEdited :: FilePath -> IO (Bool)
fileIsBeingEdited fileToCheck = do
  files <- ls "."
  let fileToCheckSW = fileToCheck ++ ".sw"
  return (fileToCheckSW `elem` files)
