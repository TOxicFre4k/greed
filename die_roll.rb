class DieRoll
    def die_roll_initial(player)
        values = []
        (1..5).each do
            values.unshift(Random.new.rand(1..6))
        end
        puts "\nDice Values for Player #{player}: #{values.inspect}" 
        return values
    end       
    
    def die_roll_multiple(player, left)
        values = []
        (1..left).each do
            values.unshift(Random.new.rand(1..6))
        end
        puts "\nDice Values for Player #{player} for Re-throw is: #{values.inspect}" 
        return values
    end       
end