class Player
    attr_reader :name, :type

    def initialize
        puts "Nom de joueur ?"
        @name = gets.chomp
        puts "x ou o ?"
        @type = gets.chomp
        until (@type == "x" || @type == "o")
            puts "Choisissez entre x et o svp !" unless (@type == "x" || @type == "o")
            @type = gets.chomp unless (@type == "x" || @type == "o")
        end
    end

end