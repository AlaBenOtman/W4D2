require 'byebug'
module Slideable

    HORIZONTAL_DIRS: [
        [ 0, -1 ], #left
        [ 0, 1 ], #right
        [ -1, 0 ], #up (vertical)
        [ 1, 0 ] #down (vertical)
    ].freeze
    
    DIAGONAL_DIRS: [
        [ -1, -1 ],  #up + left
        [ -1, 1 ],  #up + right
        [ 1, -1 ],  # down + left
        [ 1, 1 ] #down + right
    ].freeze

    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves 
        #assumed #move_dirs is an array with directions 
        moves = []

        #need to check each piece's move_dirs before loop:

        HORIZONTAL_DIRS.each do |h_dir|
            moves << grow_unblocked_moves_in_dir(*h_dir) #method call

        end
        
        DIAGONAL_DIRS.each do |d_dir|
            moves << grow_unblocked_moves_in_dir(*d_dir)
        end
        moves
    end
    
    private
    def grow_unblocked_moves_in_dir(dx, dy) #method definition
        #assume we know piece instance's self.pos & have access to its self.board 
        dir_moves = []

        curr_pos = self.pos.dup

        while self.board.valid_pos?(curr_pos) #(curr_pos[0] < 7 && curr_pos[0] > 0 ) && (curr_pos[1] < 7 && curr_pos[1] > 0 )
            curr_pos[0] += dx
            curr_pos[1] += dy
            curr_piece = self.board[curr_pos] #the piece that is at curr_pos on self.board
            if current_piece == nil #empty - change to nullpiece later
                dir_moves << curr_pos.dup
            else
                curr_piece.color != self.color ? dir_moves << curr_pos.dup : break
            end
        end
        dir_moves
    end

end

#[+1,-1] [+1,+1][-1,+1] [-1,-1]

# #chess board 8 x 8:
# [[[0, 0], [0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7]],
#  [[1, 0], [1, 1], [1, 2], [1, 3], [1, 4], [1, 5], [1, 6], [1, 7]],
#  [[2, 0], [2, 1], [2, 2], [2, 3], [2, 4], [2, 5], [2, 6], [2, 7]],
#  [[3, 0], [3, 1], [3, 2], [3, 3], [3, 4], [3, 5], [3, 6], [3, 7]],
#  [[4, 0], [4, 1], [4, 2], [4, 3], [4, 4], [4, 5], [4, 6], [4, 7]],
#  [[5, 0], [5, 1], [5, 2], [5, 3], [5, 4], [5, 5], [5, 6], [5, 7]],
#  [[6, 0], [6, 1], [6, 2], [6, 3], [6, 4], [6, 5], [6, 6], [6, 7]],
#  [[7, 0], [7, 1], [7, 2], [7, 3], [7, 4], [7, 5], [7, 6], [7, 7]]]

#rook_positions = [[0,0], [0,7], [7,0], [7,7]]
#knight_positions = [[0,1], [0,6], [7,1], [7,6]]
#queen_positions = [[0,4], [7,4]]

