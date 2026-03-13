local function somar(a, b)
    return a + b
end

local function subtrair(a, b)
    return a - b
end

local function multiplicar(a, b)
    return a * b
end

local function dividir(a, b)
    if b == 0 then
        return nil, "Erro: divisao por zero nao e permitida."
    end

    return a / b
end

local function calculadora(a, b, operador)
    if operador == "+" then
        return somar(a, b)
    end

    if operador == "-" then
        return subtrair(a, b)
    end

    if operador == "*" then
        return multiplicar(a, b)
    end

    if operador == "/" then
        return dividir(a, b)
    end

    return nil, "Erro: operador invalido. Use +, -, * ou /."
end

io.write("Digite o primeiro numero: ")
local numero1 = tonumber(io.read())

io.write("Digite o segundo numero: ")
local numero2 = tonumber(io.read())

io.write("Digite o operador (+, -, * ou /): ")
local operador = io.read()

if numero1 == nil or numero2 == nil then
    print("Erro: os valores informados devem ser numeros validos.")
    os.exit(1)
end

local resultado, erro = calculadora(numero1, numero2, operador)

if erro ~= nil then
    print(erro)
    os.exit(1)
end

print("Resultado: " .. resultado)