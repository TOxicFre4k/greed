require_relative 'players.rb'
require_relative 'die_roll.rb'
require_relative 'point_calc.rb'
require_relative 'throw_logic.rb'

class MainClass

    attr_accessor :number

    def player_number
        @player = Players.new
        @number = @player.team_players
        puts "\nNumber of Players : #{@number}"
    end

    def roller
        logic = ThrowLogic.new
        (1..@number).each do |i|
            @player_score, @scoring_dies, @non_scoring_dies, @total_score, @counter = logic.throw(i)
            puts "\nPlayer score is: #{@player_score}"
        end
        (1..@number).each do |i|
            puts "\nTotal Score of - Player #{i}:  #{@total_score[i-1]}"
        end
    end
end
