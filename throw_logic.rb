require_relative "die_roll.rb"
require_relative "point_calc.rb"

class ThrowLogic

    attr_accessor :score, :counter
    @score = 0
    @counter = 0
    $all_player_score = []
    $counter_keep = []

    def throw(player)
        @score = 0
        @counter = 0
        $all_player_score[player-1] = 0 if $all_player_score[player-1] == nil
        $counter_keep[player-1] = 0 if $counter_keep[player-1] == nil
        die_roller = DieRoll.new
        calculator = PointCalculator.new
        @die_values = die_roller.die_roll_initial(player)
        @score_first, @scoring, @non_scoring = calculator.calc(@die_values)
        @score += @score_first + $all_player_score[player-1]
        puts "\nScore in Initial Throw: #{@score}"
        if @score >= 300 || $counter_keep[player-1] > 0
            @counter += 1
            $counter_keep[player-1] = @counter
            loop do
                if @non_scoring > 0 && @scoring > 0
                    print "\nDo you wish to continue with Re-throw? : "
                    @continue_rethrow = STDIN.gets.chomp.to_s
                    if @continue_rethrow == "Y" || @continue_rethrow == 'y'
                        @die_values = die_roller.die_roll_multiple(player, @non_scoring)
                        @score_again, @scoring, @non_scoring = calculator.calc(@die_values)
                        if @scoring == 0 && @non_scoring > 0
                            @score = 0
                        else
                            @score += @score_again
                        end
                        puts "\nTotal Score after Re-throw: #{@score}"
                    elsif @continue_rethrow == "N" || @continue_rethrow == 'n'
                        puts "\nRe-throw cancelled. Total Score in this round is #{@score}"
                        break
                    else
                    end
                elsif @scoring > 0 && @non_scoring == 0
                    puts "\nCongrats! You get an extra chance! Re-throw activated!"
                    @non_scoring = 5
                else
                end
                break if @scoring == 0
            end
            $all_player_score[player-1] = @score 
            return @score, @scoring, @non_scoring, $all_player_score, @counter, $counter_keep
        elsif @score < 300
            puts "\nUnable to continue as score is less than 300! Please try again in next throw!"
            @score = 0
            $all_player_score[player-1] = @score 
            return @score, @scoring, @non_scoring, $all_player_score, @counter, $counter_keep
        end
    end
    @counter = 0
end