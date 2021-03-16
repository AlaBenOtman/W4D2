module Slideable

    HORIZONTAL_DIRS: []
    DIAGONAL_DIRS: []

    def horizontal_dirs
        
    end

    def moves 
        #assumed #move_dirs is an array with directions 
        moves = []
        curr_row,curr_col = @pos
        if move_dirs.include?(:horizontal) 
             
            (0..7).each do |new_col|
                moves << [curr_row,new_col] unless new_col == curr_col 
            end
        end
        if move_dirs.include?(:vertical)
            (0..7).each do |new_row|
                moves << [new_row,curr_col] unless new_row == curr_row
            end
        end
        if move_dirs.include?(:diagonal)
            
        end
    end

end