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

  @one = '_'; @two = '_'; @three = '_'
  @four = '_'; @five = '_'; @six = '_'
  @seven = '_'; @eight = '_'; @nine = '_'

  def self.display
    puts "\t\tWelcome to Tic-Tac-toe"
    puts "\t\t\t3  #{@seven}  #{@eight}  #{@nine}"
    puts "\t\t\t2  #{@four}  #{@five}  #{@six}"
    puts "\t\t\t1  #{@one}  #{@two}  #{@three}"
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
        print "\n#{@player1.name.chomp} to enter number of square to place a cross: "
        input = gets
        self.update_display(input.chomp,'X')
        p1 = !p1

      else
        print "\n#{@player2.name.chomp} to enter number of square to place a nought: "
        input = gets
        self.update_display(input.chomp,'O')
        p1 = !p1
      end
      times -= 1
    end
  end

  def self.update_display(input,turn)
    case input
    when "1"
      @one = turn
      self.display
    when "2"
      @two = turn
      self.display
    when "3"
      @three = turn
      self.display
    when "4"
      @four = turn
      self.display
    when "5"
      @five = turn
      self.display
    when "6"
      @six = turn
      self.display
    when "7"
      @seven = turn
      self.display
    when "8"
      @eight = turn
      self.display
    when "9"
      @nine = turn
      self.display
    else
      puts 'Wrong input type please enter a numbet from 1 to 9'
    end
  end

end

Game.new
Game.start