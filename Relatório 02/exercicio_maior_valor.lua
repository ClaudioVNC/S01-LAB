local function encontrar_maior_valor(numeros)
    local maior = numeros[1]

    for i = 2, #numeros do
        if numeros[i] > maior then
            maior = numeros[i]
        end
    end

    return maior
end

io.write("Digite a quantidade de valores N: ")
local N = tonumber(io.read())

if N == nil or N < 1 or N % 1 ~= 0 then
    print("Erro: N deve ser um numero inteiro positivo.")
    os.exit(1)
end

local numeros = {}

for i = 1, N do
    io.write("Digite o " .. i .. "o valor inteiro: ")
    local valor = tonumber(io.read())

    if valor == nil or valor % 1 ~= 0 then
        print("Erro: todos os valores devem ser numeros inteiros validos.")
        os.exit(1)
    end

    numeros[i] = valor
end

local maior_valor = encontrar_maior_valor(numeros)
print("O maior valor da tabela e: " .. maior_valor)
