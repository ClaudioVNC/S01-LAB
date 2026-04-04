io.write("Digite o valor de M (inicio do intervalo): ")
local M = tonumber(io.read())

io.write("Digite o valor de N (fim do intervalo): ")
local N = tonumber(io.read())

io.write("Digite o valor de X (numero da tabuada): ")
local X = tonumber(io.read())

if M == nil or N == nil or X == nil then
    print("Erro: todos os valores devem ser numeros inteiros validos.")
    os.exit(1)
end

if M > N then
    print("Erro: o valor de M deve ser menor ou igual a N.")
    os.exit(1)
end

print("\nTabuada de " .. X .. " de " .. M .. " ate " .. N .. ":")
for i = M, N do
    print(X .. " x " .. i .. " = " .. (X * i))
end
