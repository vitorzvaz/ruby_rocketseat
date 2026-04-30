numero_1 = ""
numero_2 = ""
operador = ""

puts "Calculadora FERA:"
puts "-" * 100

begin
  puts "Digite um número ai fera: "
  numero_1 = Float(gets.chomp)
rescue ArgumentError
  puts "[ERRO] Digite um número válido! Tente novamente."
  retry
end

begin
  puts "Agora o que tu quer fazer? ( Soma + | Subtração - | Multiplicação * | Divisão /): "
  operador = gets.chomp
  raise ArgumentError unless ["+", "-", "*", "/"].include?(operador)
rescue ArgumentError
  puts "[ERRO] Operador inválido! Tente novamente."
  retry
end

begin
  puts "Bota o segundo número agora fera: "
  numero_2 = Float(gets.chomp)
  raise ZeroDivisionError if operador == "/" && numero_2 == 0
rescue ArgumentError
  puts "[ERRO] Digite um número válido! Tente novamente."
  retry
rescue ZeroDivisionError
  puts "[ERRO] Divisão por zero não é permitida! Tente novamente."
  retry
end

case operador
when "+"
    resultado = numero_1 + numero_2
when "-"
    resultado = numero_1 - numero_2
when "*"
    resultado = numero_1 * numero_2
when "/"
    resultado = numero_1 / numero_2
end

puts "-" * 100
puts "Operação solicitada:"
puts "#{numero_1} #{operador} #{numero_2}"
puts "-" * 100
puts "Resultado:"
puts resultado
