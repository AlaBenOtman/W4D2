require_relative 'piece'
require_relative 'stepable'
require 'colorize'

class King < Piece
    include Stepable

    def symbol
        '♚'.colorize(color)
    end

    protected
    def move_diffs 
        [ [-1,0],
          [1,0],
          [0,-1],
          [0,1] ]
    end
end

