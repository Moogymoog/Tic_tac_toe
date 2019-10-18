class Game
    attr_accessor :size, :current_player, :status, :count

    def initialize
        puts "Salut mes deux petits chenapans, vous voulez jouer à un morpion grand comment (3 étant le plus petit possible et 9 le plus grand possible) ?"
        @size = gets.chomp.to_i
        until @size.between?(3, 9)
            puts "Choisissez entre 3 et 9 svp !" unless @size.between?(3, 9)
            @size = gets.chomp.to_i unless @size.between?(3, 9)
        end
        @player1 = Player.new
        @player2 = Player.new
        @current_player = @player1
        @new_game = Board.new(@size)
        @new_game.display_board
        @count = 0
    end

    def turn
        @new_game.play_turn(@current_player.name, @current_player.type)
        @new_game.display_board
        @new_game.victory?
        if @current_player == @player1
            @current_player = @player2 unless (@new_game.victory? || @new_game.tie?)
        elsif @current_player == @player2
            @current_player = @player1 unless (@new_game.victory? || @new_game.tie?)
        end
    end

    def new_round
        if @count == 0
            @count += 1
            return false
        else
            puts "Partie #{@count} terminée"
            if @new_game.tie?
                puts "Match nul"
            elsif @new_game.victory?
                puts "C'est #{@current_player.name} le vainqueur."
            end
            puts "Souhaitez-vous recommencer une nouvelle partie (y/n) ?"
            restart = gets.chomp
            if restart == "y" || restart == "Y"
                @count += 1
                puts "Salut mes deux petits chenapans, vous voulez jouer à un morpion grand comment (3 étant le plus petit possible et 9 le plus grand possible) ?"
                @size = gets.chomp.to_i
                    until @size.between?(3, 9)
                    puts "Choisissez entre 3 et 9 svp !" unless @size.between?(3, 9)
                    @size = gets.chomp.to_i unless @size.between?(3, 9)
                    end
                @new_game = Board.new(@size)
                @new_game.display_board
                self.turn
                return false
            else
                return true
            end
        end
    end

    def game_end
        if @new_game.victory?
            return true
        elsif @new_game.tie?
            return true
        end
    end

end