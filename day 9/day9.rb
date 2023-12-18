# input = File.read('input.txt')

# lines = input.split(/\n/)

data_test = "0 3 6 9 12 15
1 3 6 10 15 21
10 13 16 21 30 45"

lines = data_test.split(/\n/)

numbers = lines.map { |t| t.split(" ") }

print numbers

next_line = []

numbers.each do |number|
  next_line << number

  number.each do |n|
    


end
