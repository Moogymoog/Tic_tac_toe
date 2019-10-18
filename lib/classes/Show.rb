class Show
    def show_board
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
end