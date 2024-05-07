# class for orfanising plyers
class Players
    @@players = []
    @@limit = 3
    @@player_moves = []
  def initialize(name)  
    if @@players.length < @@limit
      @name = name
      @@players.push(@name)
      player_active
    else
      (raise 'Only two players can play the game')
    end
  end

  def self.info
    puts "THE PLAYERS ARE #{@@players}"
    puts "\n#{@@players[0]} is #{@@player_moves[0]}"
    puts "#{@@players[1]} is #{@@player_moves[1]}"
  end

  protected

  def player_active
    puts "\n#{@name} has entered the game"

    if @@players.length <= 1
      @@player_moves.push(choose_move)
    else
      if @@player_moves[0] == 'X'
        @@player_moves.push('O')
      else
        @@player_moves.push('X')
      end
    end
  end

  def choose_move
    move = ""
    until move == 'X' || move == 'O'
      puts "#{@name} choose your move: `X` or `O`"
      move = gets.chomp.upcase
    end
    move
  end
end

# class for playing game
class Game < Players
  def initialize
  end
end

puts "\nEnter your name player 1"
name_one = gets.chomp
Players.new(name_one)

puts "\nEnter your name player 2"
name_two = gets.chomp
Players.new(name_two)

Players.info
print "\nBelow are the options you have to play as 'X' or 'O' from position 0 - 8\n"
Game.new
