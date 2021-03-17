require_relative 'piece'
require_relative 'slideable'
require 'colorize'

class Bishop < Piece
    include Slideable

    def symbol
        '♝'.colorize(color)
    end

    protected 

    def move_dirs 
        # return ["diagonal"] #check
        diagonal_dirs
    end

end