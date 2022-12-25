class Game
  attr_accessor :numbers, :name

  def initialize
    @numbers = {
      one: '_', two: '_', three: '_',
      four: '_', five: '_', six: '_',
      seven: '_', eight: '_', nine: '_'
    }
    @player1 = @player2 = ''
    @winner = @err = false
    @inputs = []
    @name = ''
  end

  def start
    display
    get_names
    get_input
  end

  def display
    puts "\t\t|=============================|"
    puts "\t\t|======== TIC TAC TOE ========|"
    puts "\t\t|=============================| "
    puts "\t\t\t3  #{numbers[:seven]}  #{@numbers[:eight]}  #{@numbers[:nine]}"
    puts "\t\t\t2  #{@numbers[:four]}  #{@numbers[:five]}  #{@numbers[:six]}"
    puts "\t\t\t1  #{@numbers[:one]}  #{@numbers[:two]}  #{@numbers[:three]}"
    puts "\t\t\t   1  2  3"
  end

  def get_names
    while @player2.length < 1
      loop do
        puts 'Each player must choose a name'
        print 'Enter a name: '
        @name = gets.chomp
        break if name.length > 1

        puts 'Failed! Name should be more than 1 character'
      end
      @player1 == '' ? @player1 = name : @player2 = name
      puts 'Name have been saved successfully'
    end
  end

  def get_input
    times = 9
    while times.positive?
      return winner(@player1) if player_turn(@player1, 'X')

      return winner(@player2) if player_turn(@player2, 'O')

      return puts "\n\t\t\tThere was a tie" if times == 1

      times -= 1
    end
  end

  def player_turn(player, turn)
    player1 = "\n#{@player1} to enter number of square to place a cross: "
    player2 = "\n#{@player2} to enter number of square to place a nought: "
    loop do
      print player == @player1 ? player1 : player2
      input = gets.chomp
      update_display(input, turn)
      if @err == true
        @err = false
        redo
      end
      return game_over?(turn)
    end
  end

  def game_over?(turn)
    winning_combination = [
      [@numbers[:one], @numbers[:two], @numbers[:three]],
      [@numbers[:one], @numbers[:four], @numbers[:seven]],
      [@numbers[:seven], @numbers[:eight], @numbers[:nine]],
      [@numbers[:nine], @numbers[:six], @numbers[:three]],
      [@numbers[:four], @numbers[:five], @numbers[:six]],
      [@numbers[:eight], @numbers[:five], @numbers[:two]],
      [@numbers[:one], @numbers[:five], @numbers[:nine]],
      [@numbers[:seven], @numbers[:five], @numbers[:three]]
    ]

    winning_combination.each { |i| return true if i.all?(turn) }

    return false
  end

  def winner(player)
    puts "\n\t\t\t#{player} has won"
  end

  def update_display(input, turn)
    if @inputs.include?(input)
      @err = true
      return puts 'Square already used, Try another empty square'
    end

    possible_inputs = [
      ['1', :one], ['2', :two], ['3', :three],
      ['4', :four], ['5', :five], ['6', :six],
      ['7', :seven], ['8', :eight], ['9', :nine]
    ]

    possible_inputs.each do |i|
      next unless input == i[0]

      @inputs << input
      @numbers[i[1]] = turn
      return display
    end

    @err = true
    puts 'Wrong input type please enter a number from 1 to 9'
  end
end

# j = Game.new
# j.start
