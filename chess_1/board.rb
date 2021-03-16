require_relative "./piece.rb"
class Board 

    def initialize
        @rows = Array.new(8){Array.new(8)}
        @null_piece = NullPiece.new()

    end

    def move_piece(color,start_pos, end_pos)
        if @rows[start_pos].nil? 
            raise "There is no piece at #{start_pos} "
        elsif !valid_pos?(end_pos)
            raise "The piece can not move to #{end_pos}"
        else 
            @rows[start_pos] = nil 
            @rows[end_pos] = 
        end
    end





end