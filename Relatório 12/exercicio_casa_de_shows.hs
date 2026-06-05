data Banda = Banda
  { nome   :: String
  , genero :: String
  , cache  :: Double
  } deriving (Show)

data StatusEvento = Ativo | Encerrado | Cancelado deriving (Show)

data Evento = Evento
  { bandas :: [Banda]
  , status :: StatusEvento
  } deriving (Show)

custoTotalEvento :: Evento -> Double
custoTotalEvento evento
  | isCancelado (status evento) = 0.0
  | otherwise                   = sum (map cache (bandas evento)) * 1.20
  where
    isCancelado Cancelado = True
    isCancelado _         = False

bandaAbertura :: Evento -> String
bandaAbertura (Evento []    _) = "Nenhuma banda no evento."
bandaAbertura (Evento (b:_) _) = nome b

bandaEncerramento :: Evento -> String
bandaEncerramento (Evento [] _) = "Nenhuma banda no evento."
bandaEncerramento (Evento bs _) = nome (last bs)

exibirEvento :: String -> Evento -> IO ()
exibirEvento label evento = do
  putStrLn $ "--- " ++ label ++ " ---"
  putStrLn $ "Status: "             ++ show (status evento)
  putStrLn $ "Banda de abertura: "  ++ bandaAbertura evento
  putStrLn $ "Banda de encerramento: " ++ bandaEncerramento evento
  putStrLn $ "Custo total: R$ "     ++ show (custoTotalEvento evento)
  putStrLn ""

main :: IO ()
main = do
  let evento1 = Evento
        { bandas = [ Banda "The Midnight"   "Synthwave" 5000.00
                   , Banda "Carpenter Brut" "Darksynth" 7000.00
                   , Banda "Perturbator"    "Darksynth" 6500.00
                   ]
        , status = Ativo
        }

  let evento2 = Evento
        { bandas = [ Banda "Daft Punk"  "Electronic" 20000.00
                   , Banda "Kavinsky"   "Synthwave"   8000.00
                   ]
        , status = Encerrado
        }

  let evento3 = Evento
        { bandas = [ Banda "Justice"  "Electronic" 15000.00
                   , Banda "SebastiAn" "Electronic"  9000.00
                   ]
        , status = Cancelado
        }

  putStrLn "=== Casa de Shows - Eventos da Noite ==="
  putStrLn ""
  exibirEvento "Evento 1" evento1
  exibirEvento "Evento 2" evento2
  exibirEvento "Evento 3" evento3
