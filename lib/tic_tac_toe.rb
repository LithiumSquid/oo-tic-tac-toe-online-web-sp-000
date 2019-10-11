class TicTacToe
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
  
  
  def initialize
    @board = Array.new(9, " ")
  end
  
    def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end
  
  def input_to_index(user_input)
    index = user_input.to_i - 1
  end
  
  def position_taken?(index)
    if @board[index].nil? || @board[index] == " "
      return false
    else
      return true
  end
end
  
  def valid_move?(index)
    if index.between?(0,8) && position_taken?(index) == false
      return true
    else
      return false
  end
end

  def move(index, player = "X")
    @board[index] = player
  end

  def turn_count
    @board.each.count{|x| x =="X" || x =="O"}
end

def current_player
  turn = turn_count
  if turn % 2 == 0
    player = "X"
  else
    player = "O"
  end
  return player
end

def turn
  puts "Please input 1-9"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(index)
    player = current_player
    move(index, player)
    display_board
  else
    turn
  end
end
end

def won?
  WIN_COMBINATIONS.each do |combo|
    
    if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
      return combo
    else if @board[combo[0]] == "O" && @board[combo[2]] == "O" && @board[combo[3]] == "O"
      return combo
    else
      return false
end
end
end


def full?
  @board.all?{|x| x == "X" || x == "O"}
end

  def draw?
    if full? == true && won? == false
      return true
    else
      return false
  end
end

  
  def over?
    if won? || draw?
      return true
    else
      return false
    end
end

def winner
  win_combo = []
  win_combo = win?
  if win_combo == false
    return nil
  else if @board[win_combo[0]] == "X"
    return "X"
  else
    return "O"
  end
end
end
  
  def play
  until over? == true
    turn
  end

  if won?
    puts "Congratulations #{winner}!"
  else if draw? == true
    puts "Cat's Game!"
  end
end
end
  
end
    