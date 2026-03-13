local function filtrar_impares(numeros)
    local impares = {}

    for i = 1, #numeros do
        if numeros[i] % 2 ~= 0 then
            impares[#impares + 1] = numeros[i]
        end
    end

    return impares
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

local impares = filtrar_impares(numeros)

if #impares == 0 then
    print("Nenhum numero impar foi encontrado na tabela.")
else
    print("Nova tabela com numeros impares:")
    print(table.concat(impares, ", "))
end