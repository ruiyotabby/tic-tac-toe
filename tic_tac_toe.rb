class Player
  attr_reader :name

  @@players = 0

  def initialize(name)
    @name = name
    @@players += 1
  end

  def self.players
    @@players
  end
end

class Game

  def self.start

    self.display

    self.get_names

  end

  private

  @numbers = {
    one: '_', two:'_', three: '_',
    four: '_', five: '_', six: '_',
    seven: '_', eight: '_', nine: '_'
  }

  def self.display
    puts "\t\tWelcome to Tic-Tac-toe"
    puts "\t\t\t3  #{@numbers[:seven]}  #{@numbers[:eight]}  #{@numbers[:nine]}"
    puts "\t\t\t2  #{@numbers[:four]}  #{@numbers[:five]}  #{@numbers[:six]}"
    puts "\t\t\t1  #{@numbers[:one]}  #{@numbers[:two]}  #{@numbers[:three]}"
    puts "\t\t\t   1  2  3"
  end

  @player1 = ''
  @player2 = ''

  def self.get_names
    while Player.players < 2
      name = ''
      while name.length <= 2
        puts 'Each player must choose a name'
        print "Enter name: "
        name = gets
      end
      unless name == ''
        if @player1 == ''
          @player1 = Player.new(name)
        else
          @player2 = Player.new(name)
        end
          name = ''
          puts 'Name have been saved successfully'
      end
    end

    self.get_input

  end

  def self.get_input
    times = 9
    p1 = false
    input = ''

    while times > 0
      if p1 == false
        print "\n\s#{@player1.name.chomp} to enter number of square to place a cross: "
        input = gets
        self.update_display(input.chomp,'X')
        if @@err == true
          times += 1
          @@err = false
        else
          p1 = !p1
        end
        if times <= 5; self.check_winner(@player1,'X') end
        if @@winner == true
          return puts "\n\t\t\t#{@player1.name.chomp} has won"
        elsif times == 1
          return puts "\n\t\t\tThere was a tie"
        end
      else
        print "\n#{@player2.name.chomp} to enter number of square to place a nought: "
        input = gets
        self.update_display(input.chomp,'O')
        if @@err == true
          times += 1
          @@err = false
        else
          p1 = !p1
        end
        if times <= 5; self.check_winner(@player2,'O') end
        if @@winner == true
          return puts "\n\t\t\t#{@player2.name.chomp} has won"
        elsif times == 1
          return puts "\n\t\t\tThere was a tie"
        end
      end


      times -= 1
    end
  end

  @@winner = false

  def self.check_winner(player,turn)
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

  @@inputs = []
  @@err = false

  def self.update_display(input,turn)

    if @@inputs.include?(input)
      @@err = true
      return puts 'Square already used, Try another empty square'
    end

    @@inputs << input

    case input
    when "1"
      @numbers[:one] = turn
      self.display
    when "2"
      @numbers[:two] = turn
      self.display
    when "3"
      @numbers[:three] = turn
      self.display
    when "4"
      @numbers[:four] = turn
      self.display
    when "5"
      @numbers[:five] = turn
      self.display
    when "6"
      @numbers[:six] = turn
      self.display
    when "7"
      @numbers[:seven] = turn
      self.display
    when "8"
      @numbers[:eight] = turn
      self.display
    when "9"
      @numbers[:nine] = turn
      self.display
    else
      @@err = true
      puts 'Wrong input type please enter a number from 1 to 9'
    end
  end

end

Game.new
Game.start