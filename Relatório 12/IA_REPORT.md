# IA Report — Relatório 12

Registo dos prompts utilizados durante a resolução dos exercícios e o código gerado pela IA em resposta a cada um.

---

## Prompt 1

**Exercício:** 1, 2, 3 e 4  
**Prompt enviado:**
> como eu crio um tipo de dado em haskell com vários campos? tipo quero algo como uma struct com nome, tipo e preço, e que eu consiga imprimir ele direto no terminal

**Código adicionado pela IA:**

```haskell
data Bebida = Bebida
  { nome  :: String
  , tipo  :: String
  , preco :: Double
  } deriving (Show)
```

```haskell
data Item = Item
  { nome      :: String
  , categoria :: String
  , preco     :: Double
  } deriving (Show)
```

---

## Prompt 2

**Exercício:** 1, 2, 3 e 4  
**Prompt enviado:**
> como funciona o guard em haskell? quero fazer uma função que retorna 0 se o status for cancelado e calcula o valor normal nos outros casos, usando where pra não repetir o cálculo

**Código adicionado pela IA:**

```haskell
valorTotalPedido :: Pedido -> Double
valorTotalPedido pedido
  | isCancelado (status pedido) = 0.0
  | otherwise                   = sum (map preco (bebidas pedido))
  where
    isCancelado Cancelado = True
    isCancelado _         = False
```

```haskell
valorFinal :: Compra -> Double
valorFinal compra
  | isCancelada (status compra) = 0.0
  | total > 200                 = total * 0.90
  | otherwise                   = total
  where
    total = totalItens (itens compra)
    isCancelada Cancelada = True
    isCancelada _         = False
```

---

## Prompt 3

**Exercício:** 1 e 2  
**Prompt enviado:**
> como eu faço pra pegar o primeiro elemento de uma lista em haskell sem usar índice? e como eu evito erro quando a lista tiver vazia, tipo verificar isso antes de tentar acessar

**Código adicionado pela IA:**

```haskell
primeiraBebida :: Pedido -> String
primeiraBebida (Pedido []    _) = "Nenhuma bebida no pedido."
primeiraBebida (Pedido (b:_) _) = nome b
```

```haskell
primeiroServico :: Atendimento -> String
primeiroServico (Atendimento []    _) = "Nenhum servico contratado."
primeiroServico (Atendimento (s:_) _) = nome s
```

---

## Prompt 4

**Exercício:** 3  
**Prompt enviado:**
> como eu pego o último elemento de uma lista em haskell? e tem como eu criar uma função separada só pra imprimir as informações de um evento, em vez de colocar tudo dentro do main?

**Código adicionado pela IA:**

```haskell
bandaEncerramento :: Evento -> String
bandaEncerramento (Evento [] _) = "Nenhuma banda no evento."
bandaEncerramento (Evento bs _) = nome (last bs)
```

```haskell
exibirEvento :: String -> Evento -> IO ()
exibirEvento label evento = do
  putStrLn $ "--- " ++ label ++ " ---"
  putStrLn $ "Status: "                ++ show (status evento)
  putStrLn $ "Banda de abertura: "     ++ bandaAbertura evento
  putStrLn $ "Banda de encerramento: " ++ bandaEncerramento evento
  putStrLn $ "Custo total: R$ "        ++ show (custoTotalEvento evento)
  putStrLn ""
```

---

## Prompt 5

**Exercício:** 2 e 4  
**Prompt enviado:**
> como eu uso if/then/else dentro do do em haskell? quero imprimir uma mensagem diferente dependendo se o total passou de um certo valor

**Código adicionado pela IA:**

```haskell
  if total > 200
    then putStrLn "Desconto de 10% aplicado!"
    else putStrLn "Sem desconto."
```

```haskell
  putStrLn   "Acrescimo de 25% aplicado (mais de 3 servicos)!"
  putStrLn $ "Valor final: R$ " ++ show (valorFinalAtendimento atendimento1)
```
