-----------------------------------------------------------------------------
-- |
-- Module      :  SQLHSExample
-- Copyright   :  (c) 2019-2021 Konstantin Pugachev
--                (c) 2019 Denis Miginsky
-- License     :  MIT
--
-- Maintainer  :  K.V.Pugachev@inp.nsk.su
-- Stability   :  experimental
-- Portability :  portable
--
-- The SQLHSExample module provides examples of using SQLHS/SQLHSSugar module.
--
-----------------------------------------------------------------------------

import SQLHSSugar
import DBReader

-- CATEGORY:     WARE,    CLASS
-- MANUFACTURER: BILL_ID, COMPANY
-- MATERIAL:     BILL_ID, WARE,   AMOUNT
-- PRODUCT:      BILL_ID, WARE,   AMOUNT, PRICE

main = readDB' defaultDBName >>= executeSomeQueries

executeSomeQueries :: (Named Table, Named Table, Named Table, Named Table) -> IO ()
executeSomeQueries (categories, manufacturers, materials, products) = do
  test "first task" firstTask
  test "second task" secondTask
  
  where
    test msg p = do
      putStrLn $ "===== execute " ++ msg ++ " ====="
      -- putStrLn . debugTable $ p & enumerate
      printResult $ p & enumerate
    
    firstTask = 
        materials // "m" `njoin` products // "p" `on` "m.BILL_ID" `jeq` "p.BILL_ID"
        `njoin` categories // "c" `on` "m.WARE" `jeq` "c.WARE"
        `wher` col "CLASS" `eq` str "Mineral"
        `orderby` ["p.WARE":asc]
        `select` ["p.WARE"]
        & distinct 

    secondTask = 
        materials // "m" `njoin` products // "p" `on` "m.BILL_ID" `jeq` "p.BILL_ID"
        `njoin` categories // "c" `on` "m.WARE" `jeq` "c.WARE"
        `wher` col "c.CLASS" `eq` str "Mineral"
        `njoin` categories // "c2" `on` "p.WARE" `jeq` "c2.WARE"
        `wher` col "c2.CLASS" `eq` str "Stuff"
        `orderby` ["p.BILL_ID":asc]
        `select` ["p.BILL_ID", "m.WARE", "p.WARE"]
        & distinct 
        & limit 0 50
