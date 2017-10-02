def default_board
  %w[0 1 2 3 4 5 6 7 8]
end

def display_board(board)
  puts
  board.each_slice(3) do |array|
    puts
    array.each do |el|
      print ' | '
      print el
      print ' | '
    end
    puts
  end
  puts
end

def input
  gets.chomp
end

player1 = 'X'
player2 = 'O'
board = nil
players_cycle = [player1, player2].cycle

loop do
  board ||= default_board
  display_board(board)
  puts 'Please enter a number on the board'
  print '> '

  if input == 'exit'
    break
  elsif default_board.include?(input)
    if board[input.to_i] == 'X' || board[input.to_i] == 'O' # next if input has already taken
      puts "#{input} has already been taken! Please enter another input."
      print '> '
      next
    end

    player = players_cycle.next
    board[input.to_i] = player
  end
end
