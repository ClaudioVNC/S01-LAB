data Item = Item
  { nome      :: String
  , categoria :: String
  , preco     :: Double
  } deriving (Show)

data StatusCompra = Pendente | Concluida | Cancelada deriving (Show)

data Compra = Compra
  { itens   :: [Item]
  , status  :: StatusCompra
  } deriving (Show)

totalItens :: [Item] -> Double
totalItens xs = sum (map preco xs)

valorFinal :: Compra -> Double
valorFinal compra
  | isCancelada (status compra) = 0.0
  | total > 200                 = total * 0.90
  | otherwise                   = total
  where
    total = totalItens (itens compra)
    isCancelada Cancelada = True
    isCancelada _         = False

main :: IO ()
main = do
  let compra = Compra
        { itens = [ Item "Espada Mestra"    "Arma"     150.00
                  , Item "Escudo Hyliano"   "Armadura"  80.00
                  , Item "Pocao de Vida"    "Consumivel" 30.00
                  , Item "Bomba"            "Consumivel" 15.00
                  ]
        , status = Concluida
        }

  let total = totalItens (itens compra)
  let final = valorFinal compra

  putStrLn "=== Lojas de Hyrule ==="
  putStrLn $ "Status da compra: " ++ show (status compra)
  putStrLn $ "Total bruto: R$ "   ++ show total
  if total > 200
    then putStrLn "Desconto de 10% aplicado!"
    else putStrLn "Sem desconto."
  putStrLn $ "Valor final: R$ "   ++ show final
