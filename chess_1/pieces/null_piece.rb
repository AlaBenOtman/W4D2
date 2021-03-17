require_relative 'piece'
require 'colorize'
require 'singleton'
class NullPiece < Piece 
    # include Singleton
    
    attr_reader :color, :board, :symbol
    attr_accessor :pos
    def initialize
        @color = nil
        @board = nil
        @pos = nil
    end

    def symbol
        return "n"
    end

    def moves 
        return []
    end





end