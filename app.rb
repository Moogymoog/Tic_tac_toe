class Board
    attr_accessor :board

    def initialize
        puts "Salut mes deux petits chenapans, vous voulez jouer à un morpion grand comment (3 étant le plus petit possible et 9 le plus grand possible) ?"
        size = gets.chomp.to_i
        until size.between?(3, 9)
            puts "Choisissez entre 3 et 9 svp !" unless size.between?(3, 9)
            size = gets.chomp.to_i unless size.between?(3, 9)
        end
        @board = Array.new(size ** 2, " ")
        puts "Quel est le petit nom de celui qui veut prendre les croix ?"
        @player1 = gets.chomp
        puts "Et de celui qui veut prendre les ronds ?"
        @player2 = gets.chomp
        @count = 0
    end
    
    def display_board
        i = 0
        a = 0
        c = 0
        puts
        print "    "
        for number in 1..Integer.sqrt(@board.length)
            print " #{number}  "
        end
        puts
        puts
        while i <= (@board.length - 1 - Integer.sqrt(@board.length))
            print "#{(c+65).chr}   "
            (Integer.sqrt(@board.length) - 1).times do
                print " #{@board[a]} |"
                a += 1
            end
            print " #{@board[a]} "
            puts
            print "    "
            print "----" * (Integer.sqrt(@board.length) - 1)
            print "---"
            puts
            c += 1
            a += 1
            i += Integer.sqrt(@board.length)
        end
        print "#{(c+65).chr}   "
        (Integer.sqrt(@board.length) - 1).times do
            print " #{@board[a]} |"
            a += 1
        end
        print " #{board[a]} "
        puts
        puts 
    end

    
    def croix
        puts "Au tour de #{@player1} où est-ce que tu veux mettre ta petite croix ?"
        choice = gets.chomp.chars
        if choice.length > 2 || choice[0].ord - 64 > Integer.sqrt(@board.length) || choice[1].to_i > Integer.sqrt(@board.length) || choice[0].ord - 64 < 1 || choice[1].to_i < 1
            puts "Hors cadre, tu perds ton tour."
        elsif @board[(choice[0].ord - 65) * Integer.sqrt(@board.length) + choice[1].to_i - 1] != " "
            puts "Déjà pris, tu perds ton tour."
        else 
            @board[(choice[0].ord - 65) * Integer.sqrt(@board.length) + choice[1].to_i - 1] = "x"
        end
    end

    def rond
        puts "Au tour de #{@player2} où est-ce que tu veux mettre ton petit rond ?"
        choice = gets.chomp.chars
        if choice.length > 2 || choice[0].ord - 64 > Integer.sqrt(@board.length) || choice[1].to_i > Integer.sqrt(@board.length) || choice[0].ord - 64 < 0 || choice[1].to_i < 0
            puts "Hors cadre, tu perds ton tour."
        elsif @board[(choice[0].ord - 65) * Integer.sqrt(@board.length) + choice[1].to_i - 1] != " "
            puts "Déjà pris, tu perds ton tour."
        else 
            @board[(choice[0].ord - 65) * Integer.sqrt(@board.length) + choice[1].to_i - 1] = "o"
        end
    end


    def winner?
        winner = " "
        for i in 0..@board.length do
            if ((@board[i] == "o") && ((@board[i] == @board[i+1] && @board[i] == @board[i+2]) || (@board[i] == @board[i+Integer.sqrt(@board.length)] && @board[i] == @board[i+Integer.sqrt(@board.length)*2]) || (@board[i] == @board[i+Integer.sqrt(@board.length)+1] && @board[i] == @board[i + Integer.sqrt(@board.length)*2+2]))) == true
                winner = @player1
            elsif ((@board[i] == "x") && ((@board[i] == @board[i+1] && @board[i] == @board[i+2]) || (@board[i] == @board[i+Integer.sqrt(@board.length)] && @board[i] == @board[i+Integer.sqrt(@board.length)*2]) || (@board[i] == @board[i+Integer.sqrt(@board.length)+1] && @board[i] == @board[i + Integer.sqrt(@board.length)*2+2]))) == true
                winner = @player2
            end
        end
        if winner == @player1 || winner == @player2
            return true
        end
    end

    def end?
        if @count == 0
            @count += 1
            return false
        else
            puts "Fin de partie numéro #{@count}."
            puts "Le gagnant de cette partie est #{@player1}"
            puts "Souhaitez-vous recommencer une nouvelle partie (y/n) ?"
            restart = gets.chomp
            if restart == "y" || restart == "Y"
                @count += 1
                jeu = Board.new
                jeu.display_board
                until jeu.winner?
                    jeu.croix && jeu.display_board
                    jeu.rond && jeu.display_board unless jeu.winner?
                end
                return false
            else 
                return true
            end
        end
    end

end


jeu = Board.new
jeu.display_board
until jeu.end?
    until jeu.winner?
        jeu.croix && jeu.display_board
        jeu.rond && jeu.display_board unless jeu.winner?
    end
end