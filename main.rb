# class for orfanising plyers
class Players
  def initialize(name)
    @players = []
    @limit = 3
    @player_moves = []
  
    if @@players.length < @@limit
      @name = name
      @@players.push(@name)
      player_active
    else
      (raise 'Only two players can play the game')
    end
  end

  protected

  def player_active
    puts "\n#{@name} has entered the game"

    if @players.length <= 1
      @player_moves.push(choose_move)
    else
      if @player_moves[0] == 'X'
        @player_moves.push('O')
      else
        @player_moves.push('X')
      end
    end
  end
end

# class for playing game
class Game < Players
  def initialize
    
  end
end

