require_relative "board.rb"
require_relative "console_human.rb"

class Game

    attr_accessor :board, :player_1, :player_2, :current_player

def initialize(player_1, player_2)
    @board = Board.new
    @player_1 = player_1
    @player_2 = player_2
    @current_player = player_2
end

def change_player
    if @current_player == player_2
        @current_player = player_1
else
        @current_player = player_2
    end

end

def print_board
    puts ""
    puts "Let's get started!'"
    puts ""
    puts "Sample board with numbers:"
    puts ""
    puts " 1 | 2 | 3 "
    puts "---+---+---"
    puts " 4 | 5 | 6 "
    puts "---+---+---"
    puts " 7 | 8 | 9 "
    puts ""
    puts "Game Board:"
    puts ""
    puts " #{board.gameboard[1]} | #{board.gameboard[2]} | #{board.gameboard[3]} "
    puts "---+---+---"
    puts " #{board.gameboard[4]} | #{board.gameboard[5]} | #{board.gameboard[6]} "
    puts "---+---+---"
    puts " #{board.gameboard[7]} | #{board.gameboard[8]} | #{board.gameboard[9]} "
    puts ""

    
end

def get_move
    current_player.get_move(board.gameboard)
end

def make_move(move)
    board.update(move, current_player.symbol)
    
end
def game_over?
    if board.full_board?
        puts "Tie game....kinda like kissing your sister."
    elsif
        board.winner?(current_player.symbol)
        puts "#(current_player) wins! Here's a cookie."
    end
end
end