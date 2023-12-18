input = File.read('input.txt')

lines = input.split(/\n/)

data = lines.map { |line| line.split(" ")}

data_convert = data.map do |d|
  d = d.map { |n| n.to_i}
end

#data test
# data = [
#   [0, 3, 6, 9, 12, 15],
#   [1, 3, 6, 10, 15, 21],
#   [10, 13, 16, 21, 30, 45],
# ]

# PART 1

def extrapolate(history)
  while history[-1].any? { |val| val != 0 }
    new_sequence = (0...history[-1].length - 1).map { |i| history[-1][i + 1] - history[-1][i] }
    history << new_sequence
  end

    start = 0

    history.reverse_each do |row|
      start += row[-1]
      row << start
    end

    history[0][-1]
  end

  sum_of_extrapolated_values = data_convert.map { |history| extrapolate([history]) }.sum

  puts "Sum of extrapolated values: #{sum_of_extrapolated_values}"

# PART 2

def extrapolate_first(history)
  while history[-1].any? { |val| val != 0 }
    new_sequence = (0...history[-1].length - 1).map { |i| history[-1][i + 1] - history[-1][i] }
    history << new_sequence
  end

    start = 0

    history.reverse_each do |row|
      start = row[0] - start
      row.unshift(start)
    end

    history[0][0]

end


sum_of_extrapolated_first_values = data_convert.map { |history| extrapolate_first([history]) }.sum

puts "Sum of extrapolated values: #{sum_of_extrapolated_first_values}"
