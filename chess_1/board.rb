require "byebug"
require_relative "./pieces/king.rb"
require_relative "./pieces/queen.rb"
require_relative "./pieces/knight.rb"
require_relative "./pieces/bishop.rb"
require_relative "./pieces/rook.rb"
require_relative "./pieces/pawn.rb"
require_relative "./pieces/null_piece.rb"

class Board 

    attr_reader :rows, :piece
    def initialize
        @rows = Array.new(8){Array.new(8)}
        @null_piece = NullPiece.new
        initialize_board
    end

    def initialize_board
        @rows.each_with_index do |row, i|
            case i
            when 0 #black
                row.each_with_index do |ele, j|
                    case j
                    when 0 || 7
                        self[[i,j]] = Rook.new(:black, @rows, [i,j])
                    when 1 || 6
                        self[[i,j]] = Knight.new(:black, @rows, [i,j])
                    when 2 || 5
                        self[[i,j]] = Bishop.new(:black, @rows, [i,j])
                    when 3 
                        self[[i,j]] = King.new(:black, @rows, [i,j])
                    when 4 
                        self[[i,j]] = Queen.new(:black, @rows, [i,j])
                    end
                end
            when 1 #black 
                row.each_with_index do |ele, j|
                    self[[i,j]] = Pawn.new(:black, @rows, [i,j])
                end
            when 6 #white
                row.each_with_index do |ele, j|
                    self[[i,j]] = Pawn.new(:white, @rows, [i,j])
                end
            when 7 #white
                row.each_with_index do |ele, j|
                    case j
                    when 0 || 7
                        self[[i,j]] = Rook.new(:black, @rows, [i,j])
                    when 1 || 6
                        self[[i,j]] = Knight.new(:black, @rows, [i,j])
                    when 2 || 5
                        self[[i,j]] = Bishop.new(:black, @rows, [i,j])
                    when 3 
                        self[[i,j]] = King.new(:black, @rows, [i,j])
                    when 4 
                        self[[i,j]] = Queen.new(:black, @rows, [i,j])
                    end
                end
            else 
                row.each_with_index do |ele, j|
                    self[[i,j]] = @null_piece
                end
            end
        end
    end

    def [](pos)
        row, col = pos
        @rows[row][col]
    end

    def []=(pos,val)
        row, col = pos
        @rows[row][col] = val
    end

    def valid_pos?(pos)
        (pos[0] < 7 && pos[0] > 0 ) && (pos[1] < 7 && pos[1] > 0 )
    end

    def move_piece(start_pos, end_pos)
        if self[start_pos].color == nil? 
            raise "There is no piece at #{start_pos} "
        elsif !valid_pos?(end_pos)
            raise "The piece can not move to #{end_pos}"
        else 
            piece = self[start_pos]
            self[start_pos].color == nil 
            self[end_pos] = piece
            #need to update pos attribute on each piece instance
        end
    end

    def inspect
    
    end  

end

new_board = Board.new


p new_board


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