data_use = []

input = File.read('input.txt')
lines = input.split("\n")

data = lines.map do |line|
  test = line.split(":")
  game = test[1]
  data_use << game

end

total_points = []
winners = []

data_use.each do |card_data|
  numbers = card_data.split("|")

  wins = numbers[0].split(" ").map(&:to_i)
  my_numbers = numbers[1].split(" ").map(&:to_i)

  wins.each do |win|
    if my_numbers.include?(win)
      winners << win
    end
  end
  case winners.count
    when 1
      total = 1
    when 2
      total = 2
    when 3
      total = 4
    when 4
      total = 8
    when 5
      total = 16
    when 6
      total = 32
    when 7
      total = 64
    when 8
      total = 128
    when 9
      total = 256
    when 10
      total = 512
    else
      total = 0
  end


  total_points << total
  winners = []
end

puts "Total points from scratchcards: #{total_points.sum}"
