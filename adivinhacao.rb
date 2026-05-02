puts "Jogo da adivinhação"
puts "-" * 50
puts "Você deve inserir o limite inferior (número mínimo) e depois o limite superior (número máximo) para iniciar o desafio"
puts "Após definido os limites, a adivinhação começa! Boa sorte."
puts "-" * 50

min_max = [{msg: "Digite o número mínimo:", val: 0}, {msg: "Digite o número máximo:", val: 0}]

min_max.each do |val|
  begin
    puts val[:msg]
    str = gets.chomp
    raise ArgumentError, "[ERRO] Digite um número inteiro." unless str.match?(/\A\d+\z/)
    val[:val] = str.to_i
  rescue ArgumentError => e
    puts e.message
    retry
  end
end

magic_number = rand(min_max[0][:val]..min_max[1][:val])
puts "Agora é hora da adivinhação!"

acertou = false
until acertou
  begin  
    puts "Qual o seu palpite?"
    str = gets.chomp
    raise ArgumentError, "[ERRO] Digite um número inteiro." unless str.match?(/\A\d+\z/)
    palpite = str.to_i
  rescue ArgumentError => e
    puts e.message
    retry
  end
  if palpite > magic_number
    puts "Seu palpite é maior que o número mágico. Tente novamente."
  elsif palpite < magic_number
    puts "Seu palpite é menor do que o número mágico. Tente novamente."
  else
    puts "Seu palpite esta......... CORRETO! Parabéns, você acertou!"
    acertou = true
  end
end