# IA Report — Relatório 13

Registo dos prompts utilizados durante a resolução dos exercícios e o código gerado pela IA em resposta a cada um.

---

## Prompt 1

**Exercício:** 1  
**Prompt enviado:**
> como eu defino um tipo de dado com campos em common lisp? tipo quero algo parecido com uma struct com nome e precoBase, sem usar classes

**Código adicionado pela IA:**

```lisp
(defstruct erva
  nome
  preco-base)
```

---

## Prompt 2

**Exercício:** 1  
**Prompt enviado:**
> como funciona o cond em common lisp? quero fazer uma função que recebe peso e idade e retorna uma string diferente dependendo dos valores, parecido com guards do haskell

**Código adicionado pela IA:**

```lisp
(defun calcula-dosagem (peso idade)
  (cond
    ((or (< idade 12) (< peso 30)) "10ml")
    ((or (< idade 18) (< peso 60)) "25ml")
    (t                             "50ml")))
```

---

## Prompt 3

**Exercício:** 2  
**Prompt enviado:**
> como eu filtro uma lista? quero remover elementos que satisfaçam uma condição, parecido com o filter do haskell

**Código adicionado pela IA:**

```lisp
(defun filtra-por-perigo (catalogo)
  (remove-if (lambda (c) (eq (criatura-periculosidade c) 'baixa)) catalogo))
```

---

## Prompt 4

**Exercício:** 2  
**Prompt enviado:**
> como eu uso o equivalente ao map? quero transformar cada elemento de uma lista numa string formatada

**Código adicionado pela IA:**

```lisp
(defun relatorio-profundidade (catalogo)
  (mapcar
    (lambda (c)
      (format nil "~a: Vive em ~a"
              (criatura-nome c)
              (criatura-ambiente c)))
    (remove-if-not
      (lambda (c) (string= (criatura-ambiente c) "Deep"))
      catalogo)))
```

---

## Prompt 5

**Exercício:** 3  
**Prompt enviado:**
> como eu encadeio filter e map? quero primeiro filtrar uma lista por tipo, depois transformar cada elemento com duas funções diferentes antes de formatar

**Código adicionado pela IA:**

```lisp
(defun processa-venda (catalogo)
  (let* ((armas
           (remove-if-not
             (lambda (i) (eq (item-tipo i) 'arma))
             catalogo))
         (com-imposto
           (mapcar
             (lambda (i)
               (make-item :nome        (item-nome        i)
                          :tipo        (item-tipo        i)
                          :preco       (adicional-imposto (item-preco i))
                          :forca-magica (item-forca-magica i)))
             armas)))
    ...))
```

---

## Prompt 6

**Exercício:** 3  
**Prompt enviado:**
> como eu crio uma cópia de uma struct com um campo modificado, sem alterar o original? preciso disso pra aplicar transformações em sequência com map

**Código adicionado pela IA:**

```lisp
(make-item :nome        (item-nome        i)
           :tipo        (item-tipo        i)
           :preco       (item-preco       i)
           :forca-magica (bonus-maldicao   (item-forca-magica i)))
```

---

## Prompt 7

**Exercício:** 4  
**Prompt enviado:**
> como eu combino filter e uma condição com dois campos da struct? quero verificar dois critérios ao mesmo tempo antes de incluir o elemento na lista filtrada

**Código adicionado pela IA:**

```lisp
(defun vale-a-pena (loc)
  (and (> (bonus-elemental loc) 500)
       (<= (local-dificuldade loc) 3)))
```

---

## Prompt 8

**Exercício:** 4  
**Prompt enviado:**
> como eu uso uma função já definida como argumento direto do remove-if-not, sem precisar escrever um lambda?

**Código adicionado pela IA:**

```lisp
(defun rota-de-farm (catalogo)
  (mapcar
    (lambda (loc)
      (format nil "~a - Recompensa: ~,1f mora"
              (local-nome loc)
              (bonus-elemental loc)))
    (remove-if-not #'vale-a-pena catalogo)))
```
