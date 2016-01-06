

class TicTacToe
WIN_COMBINATIONS=[
  [0,1,2],  # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # ETC, an array for each win combination
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]
  def initialize(board = nil)
      @board = board || Array.new(9, " ")
    end

    def current_player
      turn_count % 2 == 0 ? "X" : "O"
    end

    def turn_count
      @board.count{|token| token == "X" || token == "O"}
    end

    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end



def move(position, current_player = "X")
    @board[position.to_i-1] = current_player
  end

  def position_taken?(position)
    @board[position] != " " && @board[position] != ""   #do i have to put return here?
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)#do i have to put return here? is 1-9 correct? or 0-8?
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input)
    else
      turn
    end
    display_board
  end

def turn_count
    count=0
    @board.each do |position|
      if(position=="X"||position=="O")
        count+=1
      end
    end
    return count
  end

  def current_player
    if(turn_count%2==0)
      current_player = "X"
    else
      current_player = "O"
    end
  end

  def won?

    if empty?||draw?
      return false
    end

    WIN_COMBINATIONS.each do |combination|
      if(@board[combination[0]]=="X"&&@board[combination[1]]=="X"&&@board[combination[2]]=="X")
        return combination
      elsif(@board[combination[0]]=="O"&&@board[combination[1]]=="O"&&@board[combination[2]]=="O")
        return combination
      end
    end

  end

  def full?
    return draw?
  end

def draw?
WIN_COMBINATIONS.each do |combination|
    if(@board[combination[0]]=="X"&&@board[combination[1]]=="X"&&@board[combination[2]]=="X")
      return false
    elsif(@board[combination[0]]=="O"&&@board[combination[1]]=="O"&&@board[combination[2]]=="O")
      return false
    end
  end
  @board.each do |position|
    if (position == " "||position == ""||position==nil)
      return false
    end
  end
  return true
end

  def over?
    if !draw?&&!won?
      return false
    else
      return draw?||won?
    end
  end

 def winner
    if won?
      return @board[won?[0]]
    else
      return nil
    end
  end

#def play##something in play is throwing a weird error message
  #until over?#
 #   turn#
#  end

 # if won?
  #  puts "Congratulations #{winner}!"
  #else if draw?
   # puts "Cats Game!"
  #end
#end

end