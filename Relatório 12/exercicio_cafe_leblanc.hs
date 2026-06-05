data Bebida = Bebida
  { nome  :: String
  , tipo  :: String
  , preco :: Double
  } deriving (Show)

data StatusPedido = Aberto | Entregue | Cancelado deriving (Show)

data Pedido = Pedido
  { bebidas :: [Bebida]
  , status  :: StatusPedido
  } deriving (Show)

valorTotalPedido :: Pedido -> Double
valorTotalPedido pedido
  | isCancelado (status pedido) = 0.0
  | otherwise                   = sum (map preco (bebidas pedido))
  where
    isCancelado Cancelado = True
    isCancelado _         = False

primeiraBebida :: Pedido -> String
primeiraBebida (Pedido []    _) = "Nenhuma bebida no pedido."
primeiraBebida (Pedido (b:_) _) = nome b

main :: IO ()
main = do
  let pedido1 = Pedido
        { bebidas = [ Bebida "Cafe Noir"       "Cafe" 8.50
                    , Bebida "Cha de Camomila" "Cha"  6.00
                    , Bebida "Cafe com Leite"  "Cafe" 7.50
                    ]
        , status = Entregue
        }

  let pedido2 = Pedido
        { bebidas = [ Bebida "Suco de Laranja" "Suco"  5.00
                    , Bebida "Agua Tonica"     "Drink" 9.00
                    ]
        , status = Cancelado
        }

  putStrLn "=== Cafe Leblanc - Resumo dos Pedidos ==="
  putStrLn $ "Pedido 1 - Status: " ++ show (status pedido1)
  putStrLn $ "Primeira bebida: "   ++ primeiraBebida pedido1
  putStrLn $ "Valor total: R$ "    ++ show (valorTotalPedido pedido1)
  putStrLn ""
  putStrLn $ "Pedido 2 - Status: " ++ show (status pedido2)
  putStrLn $ "Primeira bebida: "   ++ primeiraBebida pedido2
  putStrLn $ "Valor total: R$ "    ++ show (valorTotalPedido pedido2)
