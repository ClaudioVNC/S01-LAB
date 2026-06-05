data Servico = Servico
  { nome  :: String
  , tipo  :: String
  , preco :: Double
  } deriving (Show)

data StatusAtendimento = EmAndamento | Finalizado | Cancelado deriving (Show)

data Atendimento = Atendimento
  { servicos :: [Servico]
  , status   :: StatusAtendimento
  } deriving (Show)

totalServicos :: [Servico] -> Double
totalServicos xs = sum (map preco xs)

valorFinalAtendimento :: Atendimento -> Double
valorFinalAtendimento atendimento
  | isCancelado (status atendimento)       = 0.0
  | length (servicos atendimento) > 3      = total * 1.25
  | otherwise                              = total
  where
    total = totalServicos (servicos atendimento)
    isCancelado Cancelado = True
    isCancelado _         = False

primeiroServico :: Atendimento -> String
primeiroServico (Atendimento []    _) = "Nenhum servico contratado."
primeiroServico (Atendimento (s:_) _) = nome s

main :: IO ()
main = do
  let atendimento1 = Atendimento
        { servicos = [ Servico "Banho de Lama"       "Limpeza"    40.00
                     , Servico "Esfoliacao de Escama" "Limpeza"   55.00
                     , Servico "Massagem Espiritual"  "Relaxamento" 70.00
                     , Servico "Banho de Ervas"       "Limpeza"    50.00
                     ]
        , status = Finalizado
        }

  let atendimento2 = Atendimento
        { servicos = [ Servico "Banho de Vapor"     "Relaxamento" 35.00
                     , Servico "Hidratacao Magica"  "Tratamento"  60.00
                     ]
        , status = EmAndamento
        }

  putStrLn "=== Casa de Banhos da Yubaba ==="
  putStrLn ""
  putStrLn "--- Atendimento 1 ---"
  putStrLn $ "Status: "           ++ show (status atendimento1)
  putStrLn $ "Primeiro servico: " ++ primeiroServico atendimento1
  putStrLn $ "Total bruto: R$ "   ++ show (totalServicos (servicos atendimento1))
  putStrLn   "Acrescimo de 25% aplicado (mais de 3 servicos)!"
  putStrLn $ "Valor final: R$ "   ++ show (valorFinalAtendimento atendimento1)
  putStrLn ""
  putStrLn "--- Atendimento 2 ---"
  putStrLn $ "Status: "           ++ show (status atendimento2)
  putStrLn $ "Primeiro servico: " ++ primeiroServico atendimento2
  putStrLn $ "Total bruto: R$ "   ++ show (totalServicos (servicos atendimento2))
  putStrLn $ "Valor final: R$ "   ++ show (valorFinalAtendimento atendimento2)
