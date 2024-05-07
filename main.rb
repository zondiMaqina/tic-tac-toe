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
    @position = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    @columns1 = Array.new()
    @columns2 = Array.new()
    @columns3 = Array.new()

    @rows1 = Array.new()
    @rows2 = Array.new() 
    @rows3 = Array.new() 

    @diagonal1 = Array.new()

    show_board
    play_rounds
  end

  private

  def show_board
    board =  "\n---------------------\n"
    board += "#{@position[0]} | #{@position[1]} | #{@position[2]}\n"
    board += "---+---+---\n"
    board += "#{@position[3]} | #{@position[4]} | #{@position[5]}\n"
    board += "---+---+---\n"
    board += "#{@position[6]} | #{@position[7]} | #{@position[8]}\n"
    board += "---------------------\n"
    print board
    
  end

  def play_rounds

    while true
      puts "#{@@players[0].upcase} choose position to play [0 - 8]"
      player_one_move = gets.chomp

      if @position.index('X') != player_one_move.to_i && @position.index('O') != player_one_move.to_i
        @position[player_one_move.to_i] = @@player_moves[0]
        show_board
      else
        puts "invalid input...bad luck loser"
      end

      puts "#{@@players[1].upcase} choose position to play [0 - 8]"
      player_two_move = gets.chomp

      if @position.index('X') != player_two_move.to_i && @position.index('O') != player_two_move.to_i
        @position[player_two_move.to_i] = @@player_moves[1]
        show_board
      else
        puts "invalid input...bad luck loser"
      end
      @columns1 = [@position[0], @position[3], @position[6]]
      @columns2 = [@position[1], @position[4], @position[7]]
      @columns3 = [@position[2], @position[5], @position[8]]

      @rows1 = [@position[0], @position[1], @position[2]]
      @rows2 = [@position[3], @position[4], @position[5]]
      @rows3 = [@position[6], @position[7], @position[8]]

      @diagonal = [@position[0], @position[4], @position[8]]
      
      if @rows1.all? {|pos| pos == @@player_moves[0]} || @rows2.all? {|pos| pos == @@player_moves[0]} || @rows3.all? {|pos| pos == @@player_moves[0]}

        puts "\n#{@@players[0].upcase} won the game bro"
        break
      elsif @columns1.all? {|pos| pos == @@player_moves[0]} || @columns2.all? {|pos| pos == @@player_moves[0]} || @columns3.all? {|pos| pos == @@player_moves[0]}

        puts "\n#{@@players[0].upcase} won the game bro"
        break
      elsif @diagonal.all? {|pos| pos == @@player_moves[0]}
        puts "\n#{@@players[0].upcase} won the game bro"
        break
      end

      if @rows1.all? {|pos| pos == @@player_moves[1]} || @rows2.all? {|pos| pos == @@player_moves[1]} || @rows3.all? {|pos| pos == @@player_moves[1]}

        puts "\n#{@@players[1].upcase} won the game bro"
        break
      elsif @columns1.all? {|pos| pos == @@player_moves[1]} || @columns2.all? {|pos| pos == @@player_moves[1]} || @columns3.all? {|pos| pos == @@player_moves[1]}

        puts "\n#{@@players[1].upcase} won the game bro"
        break
      elsif @diagonal.all? {|pos| pos == @@player_moves[1]}
        puts "\n#{@@players[1].upcase} won the game bro"
        break
      end
    end
end
end

puts "Welcome to Tic-Tac-Toe"
puts "\nEnter your name player 1"
name_one = gets.chomp
Players.new(name_one)

puts "\nEnter your name player 2"
name_two = gets.chomp
Players.new(name_two)

Players.info
print "\nBelow are the options you have to play as 'X' or 'O' from position 0 - 8\n"
Game.new
