class Piece 

    attr_reader :color, :board
    attr_accessor :pos
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s

    end

    # valid_moves takes moves from subclasses & filters out
    # any moves that bring user into check. 
    # def valid_moves 
        
    # end

end