class Board
    attr_accessor :board, :size
    
    def initialize(size)
        @size = size
        @board = Array.new(@size ** 2, " ")
        @count_turn
        i = 0
        array_index = 0
        letter = 0
        while i <= (@size ** 2 - 1 - Integer.sqrt(@size ** 2))
            number = 1
            (Integer.sqrt(@size ** 2) - 1).times do
                @board[array_index] = BoardCase.new(" ", "#{(letter+65).chr}#{number}")
                array_index += 1
                number += 1
            end
            @board[array_index] = BoardCase.new(" ", "#{(letter+65).chr}#{number}")
            letter += 1
            array_index += 1
            i += Integer.sqrt(@size ** 2)
        end
        number = 1
        (Integer.sqrt(@size ** 2) - 1).times do
            @board[array_index] = BoardCase.new(" ", "#{(letter+65).chr}#{number}")
            array_index += 1
            number += 1
        end
        @board[array_index] = BoardCase.new(" ", "#{(letter+65).chr}#{number}")
    end

    def play_turn(name, type)
        puts "Au tour de #{name} où est-ce que tu veux mettre un #{type} ? (format LettreChiffre => exemple : C2)"
        choice = gets.chomp
        check = Array.new
        for i in 0..(@size ** 2 - 1)
            check[i] = @board[i].id
        end
        for i in 0..(@size ** 2 - 1)
            if @board[i].id == choice
                if @board[i].value == " "
                    @board[i].value = type
                else
                    puts "Déjà pris, tu perds ton tour."
                end
            end
        end
        if check.include?(choice) == false
                puts "Hors cadre, tu perds ton tour."
        end
    end

    def display_board
        i = 0
        array_index = 0
        letter = 0
        puts
        print "    "
        for number in 1..Integer.sqrt(@size ** 2)
            print " #{number}  "
        end
        puts
        puts
        while i <= (@size ** 2 - 1 - Integer.sqrt(@size ** 2))
            print "#{(letter+65).chr}   "
            (Integer.sqrt(@size ** 2) - 1).times do
                print " #{@board[array_index].value} |"
                array_index += 1
            end
            print " #{@board[array_index].value} "
            puts
            print "    "
            print "----" * (Integer.sqrt(@size ** 2) - 1)
            print "---"
            puts
            letter += 1
            array_index += 1
            i += Integer.sqrt(@size ** 2)
        end
        print "#{(letter+65).chr}   "
        (Integer.sqrt(@size ** 2) - 1).times do
            print " #{@board[array_index].value} |"
            array_index += 1
        end
        print " #{@board[array_index].value} "
        puts
        puts 
    end

    def victory?
        check = Array.new
        for i in 0..(@size ** 2 - 1)
            check[i] = @board[i].value
        end
        for i in 0..(@size ** 2 - 1)
            if ((check[i] == "o") && ((check[i] == check[i+1] && check[i] == check[i+2] && @board[i].id.chars[0] == @board[i+1].id.chars[0] && @board[i].id.chars[0] == @board[i+2].id.chars[0]) || (check[i] == check[i+Integer.sqrt(@size ** 2)] && check[i] == check[i+Integer.sqrt(@size ** 2)*2]) || (check[i] == check[i+Integer.sqrt(@size ** 2)+1] && check[i] == check[i + Integer.sqrt(@size ** 2)*2+2]))) == true
                return true
            elsif ((check[i] == "x") && ((check[i] == check[i+1] && check[i] == check[i+2] && @board[i].id.chars[0] == @board[i+1].id.chars[0] && @board[i].id.chars[0] == @board[i+2].id.chars[0]) || (check[i] == check[i+Integer.sqrt(@size ** 2)] && check[i] == check[i+Integer.sqrt(@size ** 2)*2]) || (check[i] == check[i+Integer.sqrt(@size ** 2)+1] && check[i] == check[i + Integer.sqrt(@size ** 2)*2+2]))) == true
                return true
            else 
                return false
            end
        end
    end

    def tie?
        check = Array.new
        for i in 0..(@size ** 2 - 1)
            check[i] = @board[i].value
        end
        if (check.include?(" ")) == false
            return true
        end 
    end

end