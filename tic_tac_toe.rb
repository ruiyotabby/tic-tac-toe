class Player
@@players = 0

  def initialize(name)
    @name = name
    @@players += 1
  end

  def self.players
    @@players
  end
end

class Display
  @one = '_';@two = '_';@three = '_';@four = '_';@five = '_';@six = '_';@seven = '_';@eight = '_';@nine = '_'

  def self.start
    puts "\t\tWelcome to Tic-Tac-toe"
    puts "\t\t\t3  #{@seven}  #{@eight}  #{@nine}"
    puts "\t\t\t2  #{@four}  #{@five}  #{@six}"
    puts "\t\t\t1  #{@one}  #{@two}  #{@three}"
    puts "\t\t\t   1  2  3"

    self.get_names

  end

  def self.get_names
    while Player.players < 2
      name = ''
      while name.length <= 2
        puts 'Each player must choose a name'
        print "Enter name: "
        name = gets
      end
      unless name == ''
        Player.new(name)
        name = ''
        puts 'Name have been saved successfully'
      end
    end
  end

end

class Game

  def self.start
    Display.start
  end

end

Game.new
Game.start