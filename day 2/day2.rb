# Function to find the minimum set of cubes for a game
def minimum_set_for_game(game)

  red = []
  green = []
  blue = []

  game.each do |subset|

    subset.each do |count, color|
      count = count.to_i
      case color
      when 'red'
        red << count
      when 'green'
        green << count
      when 'blue'
        blue << count
      end
    end
  end

  [red.max, green.max, blue.max]

end

input = File.read('input.txt')
array = input.split("\n")

data = array.map do |game|
  game = game.split(":")[1]
  game = game.split(";").map { |subset| subset.scan(/(\d+) (\w+)/) }
end

#PART 1

ids = []

data.each_with_index do |game, index|
  min_set = minimum_set_for_game(game)
  red = min_set[0]
  green = min_set[1]
  blue = min_set[2]
  if red <= 12 && green <= 13 && blue <= 14
    ids << index+1
  end
end

puts "the sum of the IDs is #{ids.sum}"



# PART 2

powers = []

data.each do |game|
  min_set = minimum_set_for_game(game)
  power = min_set[0] * min_set[1]* min_set[2]
  powers << power
end


puts "the sum of the power is #{powers.sum}"
