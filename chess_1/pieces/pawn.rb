require_relative 'piece'
require 'colorize'

class Pawn < Piece

    def symbol
        'pawn'.colorize(color)
    end

    def moves
        #return an array of all positions pawn can move to
        moves = []
        moves << forward_steps
        moves << side_attacks
        moves
    end

    private

    def at_start_row?
        if self.color == :white && self.pos[0] == 6
            true
        elsif self.color == :black && self.pos[0] == 1
            true
        else
            false
        end
    end

    def forward_dir
        self.color == :white ? -1 : 1
    end

    def forward_steps #refactor this later
        forward_moves = []
        dir = self.forward_dir
        curr_pos = self.pos 
        curr_piece = self.board[curr_pos]
        if self.at_start_row?
            2.times do 
                curr_pos[0] += dir
                if curr_piece != nil
                    break
                else
                    forward_moves << curr_pos.dup
                end
            end
        else
            curr_pos[0] += dir
            forward_moves << curr_pos.dup unless curr_piece != nil
        end
        forward_moves
    end

    def side_attacks #refactor this later
        side_moves = []
        dir = self.forward_dir

        new_pos_1 = [self.pos[0] + dir, self.pos[1] + dir]
        new_pos_2 = [self.pos[0] + dir, self.pos[1] - dir]

        if self.board[new_pos_1].color != self.color && 
            self.board[new_pos_1].color != nil
            side_moves << new_pos_1 if self.board.valid_pos?(new_pos_1)
        end
        if self.board[new_pos_2].color != self.color && 
            self.board[new_pos_2].color != nil
            side_moves << new_pos_2 if self.board.valid_pos?(new_pos_2)
        end

        side_moves
    end

    #for white pawn (dir == -1)
    #side attack = [pos + dir, pos + dir]
    #               [pos + dir, pos - dir]

    #for black pawn (dir == 1)
    #side attack = [pos + dir, pos + dir]
    #               [pos + dir, pos - dir]

end