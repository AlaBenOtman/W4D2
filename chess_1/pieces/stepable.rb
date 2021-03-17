module Stepable 

    def moves 
        moves = self.move_diffs
        moves.select do |diffs|
            curr_pos = self.pos 
            curr_pos[0] += diffs[0]
            curr_pos[1] += diffs[1]
            curr_piece = self.board[curr_pos] 
            curr_piece.color == nil || curr_piece.color != self.color
        end
    end

    def move_diffs
         raise NotImplementedError
    end

end