module Stepable 
    move_diffs = [
        [-2,-1],
        [-2,1],
        [-1,-2],
        [-1,2],
        [1,-2],
        [1,2],
        [2,-1],
        [2,1]
    ].freeze
    move_diffs = [
        [-1,0],
        [1,0],
        [0,-1],
        [0,1]
    ].freeze


    def moves 

        moves = self.move_diffs
        moves.select do |diffs|
            curr_pos = self.pos 
            curr_pos[0] += diffs[0]
            curr_pos[1] += diffs[1]
            curr_piece = self.board[curr_pos] 
            curr_piece == nil || curr_piece.color != self.color

        end
    end

    def move_diffs
         raise NotImplementedError
    end





end