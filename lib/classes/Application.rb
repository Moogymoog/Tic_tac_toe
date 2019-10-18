class Application

    def perform
        play = Game.new
        until play.new_round
            until play.game_end
                play.turn
            end
        end
    end

end