require_relative 'players.rb'
require_relative 'die_roll.rb'
require_relative 'point_calc.rb'
require_relative 'throw_logic.rb'

class MainClass

    attr_accessor :number, :looping
    $looping = 0

    def player_number
        @player = Players.new
        @number = @player.team_players
        puts "\nNumber of Players : #{@number}"
    end

    def roller
        logic = ThrowLogic.new
        loop do
            (1..@number).each do |i|
                $looping = i
                @player_score, @scoring_dies, @non_scoring_dies, @total_score = logic.throw(i)
                puts "\nPlayer score is: #{@player_score}"
            end
            print "\nDo you wish to continue to next round? : "
            @continue = STDIN.gets.chomp.to_s
            if @continue == 'Y' || @continue == 'y'
                next
            end
            break if @continue == 'n' || @continue == 'n' || @total_score[($looping - $total_score.length] > 3000
        end
        (1..@number).each do |i|
            puts "\nTotal Score of - Player #{i}:  #{@total_score[i-1]}"
        end
    end
end
