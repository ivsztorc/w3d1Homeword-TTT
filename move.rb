class Move
  attr_reader :square, :player, :symbol

#def initialize(square, symbol, player)
  #@square = square
  #@symbol = symbol
  #@player = player
#end

def initialize(options={})
  @square = options.fetch(:square)
  @symbol = options.fetch(:symbol)
  @player = options.fetch(:player)
end

end