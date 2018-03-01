require 'rubygems'

class Players
    def team_players
        print "\nEnter number of players: "
        @number = STDIN.gets.chomp.to_i
        return @number
    end
end