class Game
  attr_accessor :player1, :player2
  attr_reader :moves, 

  WINNING_LINES = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6] ]

  def initialize
    @player1 ='X'
    @player2='O'
    @moves = []

  end

  def finished?
    winning_game? || drawn_game?
  end

  def result
    case 
    when drawn_game?
      "It's a draw!" 
    when winning_game?
      "#{moves.last.player} won!"
    else
      "Game's still in progress"
    end
  end



  # def play
    #mnumber_turns=1
    # while number_turns < 9
     # number_turns.odd? ? player_turn(@player1) : player_turn(@player2)
     # game_checker
     # if game_checker
       # break
     # end
     # number_turns+=1
   # end  
 # end

 # def player_turn(player)
  # puts player == 'X' ? "It's X's turn!" : "It's O's turn!"
  # puts ""
  #cell = gets.chomp
      # unless @board.keys.include?(cell) #check if the user entered a number corresponding to the grid
        # puts ""
        # puts "it has to be a number from 0 to 8"
        # player_turn(player)
      # end
      # if @board[cell] == ' ' #check if cell in grid is empty for user input
        # @board[cell] = player
      # else
        # puts ""
        # puts "That cell is occupied. Choose again!"
        # player_turn(player)
      # end
      # show_board
  # end
# end



  def make_move(player, square)
    moves << Move.new(player: player, square: square, symbol: symbol_for_player(player) )
  end


  def board
    empty_board.tap do |board|
      moves.each do |move|
        board[move.square] = move.symbol
  end



  def empty_board
      Array.new(9, nil)
  end


  private
  def winning_game?
    !!WINNING_LINES.detect do |winning_line|
      %w(XXX OOO).include?(winning_line.map { |e| board[e] }.join) 
#map looks up the winning line, check for the first winning line array, changes indexes to 0 or X, and then checks if it is XXX or 000
  end



  private
  def drawn_game?
    # (0..8).all? { |i| moves[i]}
    moves.size == 9
  end


private
  def symbol_for_player(player)
    case player
    when player1
      'X'
    when player2
      'O'
    else
      raise "OI! That's not one of my players"
    end
  end
end

