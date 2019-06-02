require "pry"

class TicTacToe
  
  attr_accessor :board

  def initialize
    @board = 
    [" ", " ", " ", 
    " ", " ", " ", 
    " ", " ", " "]
  end 
  
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [0, 4, 8],
    [1, 4, 7],
    [2, 4, 6],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [2, 5, 8]
    ]
    
    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end 
    
    def input_to_index(input)
      input.to_i - 1
    end
    
    def move(index,token = "X") # what does it do?
      @board[index] = token
    end
  
  def position_taken?(i) 
       #if @board[i] == "X" || @board[i] == "O"
    if board[i] != " "
      return true
    else 
      return false 
    end
  end 

 def valid_move?(i)
  if i < 0 || i > 8
    return false
  end
  return !position_taken?(i)
  end

  def turn
    
    puts "Enter a number between 1-9"
    
    position_taken=gets
    
    i = input_to_index(position_taken)
  
  
    isMoveValid = valid_move?(i)
    
    if isMoveValid
      move(i, current_player)
      display_board()
    else
      turn
    end
  end

  def turn_count
    count = 0
    board.each do |position|
      if position == "X" || position == "O"
        count += 1
      end
    end
    count
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O" #checks if it s even, modulo 
  end
  
  def won? 
    WIN_COMBINATIONS.find do |combo|
      @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
    end
  end

  def full?
    @board.all? { |i| i =="X" || i == "O"}
  end

  def draw?
    !won? && full? ? true : false
  end
  



end



#game = TicTacToe.new
#game.turn()
#game.turn()
#game.turn()
#game.turn_count()
#game.current_player



  