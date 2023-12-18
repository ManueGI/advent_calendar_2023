# initialisation Game class

class Game
attr_reader :numbers, :my_numbers, :game

  @@toutes_les_personnes = []

  def initialize(numbers, my_numbers, game)
    @numbers = numbers
    @my_numbers = my_numbers
    @game = game
    @@toutes_les_personnes << self
  end

  def winners
    winners = []

    wins = @numbers.split(" ").map(&:to_i)
    my_numbers = @my_numbers.split(" ").map(&:to_i)

    wins.each do |win|
      if my_numbers.include?(win)
        winners << win
      end
    end
    return winners.count
  end

  def self.all
    @@toutes_les_personnes
  end

  def self.last
    @@toutes_les_personnes.last
  end

  def self.find_by_game(game)
    @@toutes_les_personnes.find { |personne| personne.game == game }
  end

  def duplicate
    Game.new(self.numbers, self.my_numbers, self.game)
  end

  def self.delete_all
    @@toutes_les_personnes = []
  end

end


data_use = []

input = File.read('input.txt')
lines = input.split("\n")

data = lines.map do |line|
  test = line.split(":")
  game = test[1]
  data_use << game
end
print data_use

cards = []
data_use.each do |scratch|

  tes = scratch.split("|")
  cards << tes
end

game = 0


cards.each do |party|
  Game.new(party[0], party[1], game+=1)
end

test = Game.last

games = Game.all

all_cards = []

games.each_with_index do |game, index|

     cards = game.winners.to_i
     all_cards << cards
  count = 1
  basket = []
   (game.winners).times do
      Game.find_by_game(count + game.game).duplicate
    count +=1
  end
end

print all_cards.count
