class Player
  attr_reader :name, :total

  @@players = 0

  def initialize(name)
    @name = name
    @@players += 1
    @total = @@players
  end

  def self.players
    @@players
  end
end

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
    while Player.players < 2
      loop do
        puts 'Each player must choose a name'
        print 'Enter a name: '
        @name = gets.chomp
        break if name.length > 1

        puts 'Failed! Name should be more than 1 character'
      end
      @player1 == '' ? @player1 = Player.new(name) : @player2 = Player.new(name)
      @name = ''
      puts 'Name have been saved successfully'
    end
  end

  def get_input
    times = 9
    p1 = false

    while times > 0
      if p1 == false
        print "\n\s#{@player1.name} to enter number of square to place a cross: "
        input = gets.chomp
        update_display(input, 'X')
        if @err == true
          times += 1
          @err = false
        else
          p1 = !p1
        end
        if times <= 5; check_winner('X') end
        if @winner == true
          return puts "\n\t\t\t#{@player1.name} has won"
        elsif times == 1
          return puts "\n\t\t\tThere was a tie"
        end
      else
        print "\n#{@player2.name} to enter number of square to place a nought: "
        input = gets
        update_display(input,'O')
        if @err == true
          times += 1
          @err = false
        else
          p1 = !p1
        end
        if times <= 5; check_winner('O') end
        if @winner == true
          return puts "\n\t\t\t#{@player2.name} has won"
        elsif times == 1
          return puts "\n\t\t\tThere was a tie"
        end
      end
      times -= 1
    end
  end

  def check_winner(turn)
    if (@numbers[:one] == turn && @numbers[:two] == turn && @numbers[:three] == turn) ||
      (@numbers[:one] == turn && @numbers[:four] == turn && @numbers[:seven] == turn) ||
      (@numbers[:seven] == turn && @numbers[:eight] == turn && @numbers[:nine] == turn) ||
      (@numbers[:nine] == turn && @numbers[:six] == turn && @numbers[:three] == turn) ||
      (@numbers[:four] == turn && @numbers[:five] == turn && @numbers[:six] == turn) ||
      (@numbers[:eight] == turn && @numbers[:five] == turn && @numbers[:two] == turn) ||
      (@numbers[:one] == turn && @numbers[:five] == turn && @numbers[:nine] == turn) ||
      (@numbers[:seven] == turn && @numbers[:five] == turn && @numbers[:three] == turn)
      @@winner = true
    end
  end

  def update_display(input, turn)
    if @inputs.include?(input)
      @err = true
      return puts 'Square already used, Try another empty square'
    end

    @inputs << input

    case input
    when "1"
      @numbers[:one] = turn
      display
    when "2"
      @numbers[:two] = turn
      display
    when "3"
      @numbers[:three] = turn
      display
    when "4"
      @numbers[:four] = turn
      display
    when "5"
      @numbers[:five] = turn
      display
    when "6"
      @numbers[:six] = turn
      display
    when "7"
      @numbers[:seven] = turn
      display
    when "8"
      @numbers[:eight] = turn
      display
    when "9"
      @numbers[:nine] = turn
      display
    else
      @err = true
      puts 'Wrong input type please enter a number from 1 to 9'
    end
  end
end

# j = Game.new
# j.get_names
