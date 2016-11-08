class UnbeatableAi

    attr_accessor :marker

    def initialize(marker)
         @marker = marker
    end
   
    def valid_space?(board, choice)
        board[choice] == ""
    end

    def get_move(board)
        comp_marker = marker

        if comp_marker == "o"
            player_marker = "x"
        else
            player_marker = "o"
        end
        
        if potential_win_block(board, comp_marker) <= 8
            move = potential_win_block(board, comp_marker)
        elsif potential_win_block(board, player_marker) <= 8
            move = potential_win_block(board, player_marker)
        else
            move = board.index("")
        end
        move

    end
    

    def win_combinations(board)

         a = [
             [board[0], board[1], board[2]],
             [board[3], board[4], board[5]],
             [board[6], board[7], board[8]],
             [board[0], board[3], board[6]],
             [board[1], board[4], board[7]],
             [board[2], board[5], board[8]],
             [board[0], board[4], board[8]],
             [board[2], board[4], board[6]]
             ]
    end
    def win_positions       
        win_positions = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    end

    def potential_win_block(board, current_marker)

        open_spot = 10

        win_combinations(board).each_with_index do |winner, index|
            if winner.count(current_marker) == 2 && winner.count("") == 1
                winning_player = winner.index("")
                open_spot = win_positions[index][winning_player]
            end
        end
        open_spot
    end

end


# winning = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]] 
#unbeatable ai
# Win: If the player has two in a row, they can place a third to get three in a row.
# Block: If the opponent has two in a row, the player must play the third themselves to block the opponent.
# Fork: Create an opportunity where the player has two threats to win (two non-blocked lines of 2).
# Blocking an opponent's fork:
# Option 1: The player should create two in a row to force the opponent into defending, as long as it doesn't result in them creating a fork. For example, if "X" has a corner, "O" has the center, and "X" has the opposite corner as well, "O" must not play a corner in order to win. (Playing a corner in this scenario creates a fork for "X" to win.)
# Option 2: If there is a configuration where the opponent can fork, the player should block that fork.
# Center: A player marks the center. (If it is the first move of the game, playing on a corner gives "O" more opportunities to make a mistake and may therefore be the better choice; however, it makes no difference between perfect players.)
# Opposite corner: If the opponent is in the corner, the player plays the opposite corner.
# Empty corner: The player plays in a corner square.
# Empty side: The player plays in a middle square on any of the 4 sides.