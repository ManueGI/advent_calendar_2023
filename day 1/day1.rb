input = File.read('input.txt')
array = input.split(" ")


# PART 1
sum = []

array.each do |a|

  premier_chiffre = a.scan(/\d/).first.to_i
  dernier_chiffre = a.scan(/\d/).last.to_i
  result = "#{premier_chiffre}#{dernier_chiffre}"
  number = result.to_i
  sum << number
end

answer = sum.sum

puts "The sum of all of the calibration values is #{answer}"

# PART 2
sum = []

remplacements = {"one" => "o1e", "two" => "t2o", "three" => "t3e", "four" => "f4r", "five" => "f5e", "six" => "s6x", "seven" => "s7n", "eight" => "e8t", "nine" => "n9n"}

chaines_modifiees = array.map do |a|
  remplacements.each { |mot, remplacement| a.gsub!(mot, remplacement) }
  a
end

chaines_modifiees.each do |a|

  premier_chiffre = a.scan(/\d/).first.to_i
  dernier_chiffre = a.scan(/\d/).last.to_i
  result = "#{premier_chiffre}#{dernier_chiffre}"
  number = result.to_i
  sum << number
end

answer = sum.sum

puts "The sum of all of the calibration values is #{answer}"
