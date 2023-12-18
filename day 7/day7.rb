input = File.read('input.txt')

hands = input.split("\n")


def ranking(hand)
  game = hand.split(" ")[0]
  cards = game.split("")

  identical_cards = cards.group_by { |card| card }
  counts = identical_cards.map { |value, elements| elements.length }

  case
  when counts.count(5) == 1
    return [hand, 0, game]

  when counts.count(4) == 1
    return [hand, 1, game]

  when counts.count(3) == 1 && counts.count(2) == 1
    return [hand, 2, game]

  when counts.count(3) == 1
    return [hand, 3, game]

  when counts.count(2) == 2
    return [hand, 4, game]

  when counts.count(2) == 1
    return [hand, 5, game]

  else
    return [hand, 6, game]
  end
end

card_order = ['2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q', 'K', 'A'].reverse

# Classer les mains en fonction de leur force et de la valeur des cartes
sorted_hands = hands.map { |hand| ranking(hand) }.sort_by { |hand, index, game| [index, card_order.index(game[0])] }

total_winnigs = []

sorted_hands.each_with_index do |game, index|
  puts bid = game[0].split(" ")[1]
  winning = bid.to_i * (index.to_i + 1)
  total_winnigs << winning
end

puts total_winnigs.sum

# Input Test
# card_order = ['2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q', 'K', 'A'].reverse

# hands = ["32T3K 765",
#          "T55J5 684",
#          "KK677 28",
#          "KTJJT 220",
#          "QQQJA 483"]

# # Classer les mains en fonction de leur force et de la valeur des cartes
# sorted_hands = hands.map { |hand| ranking(hand) }.sort_by { |hand, index, game| [index, card_order.index(game[0])] }

# total_winnigs = []

# sorted_hands.each_with_index do |game, index|
#   puts bid = game[0].split(" ")[1]
#   winning = bid.to_i * (index.to_i + 1)
#   total_winnigs << winning
# end

# puts total_winnigs.sum
