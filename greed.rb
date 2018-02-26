def players
	print "Enter number of players: "
	number = gets.chomp.to_i
	die_roll(number)
end

$take = 0
$store = []
$check = []
$counter = 0
$final = 0

def die_roll(players)
	(1..players).each do |i|
		points = {"one" => Random.new.rand(1..6), "two" => Random.new.rand(1..6), "three" => Random.new.rand(1..6), "four" => Random.new.rand(1..6), "five" => Random.new.rand(1..6)}
		values = []
		points.each do |key, value|
			values.unshift(value)
		end
		puts "\nDice Values for Player #{i}: #{values.inspect}" 
		$take = 0
		$initial = values
		if $store.length > 0 && $store[i-1] != nil
			scoring(values, $store[i-1], i)
		elsif $store.length == 0 || $store[i-1] == nil
			scoring(values, 0, i)
		else
		end
		#puts $store.inspect
	end
	print "\nDo you wish to continue?(Y/N): "
	continue = gets.chomp
	if continue == "Y"
		die_roll(players)
	elsif continue == "N"
		puts "\nGame Ended"
		puts $store.inspect
	else
		puts "\nInvalid Entry!"
	end
	$store = []
	$counter = 0
end

def scoring(values, total, j)
	count = 0
	total_sec = 0
	loop2 = 0
	initial = 0
	if values.count(1) > 0
		if values.count(1) >= 3
			loop1 = values.count(1) - 3
			if loop1 == 0
				initial += 3
				total += 1000
				total_sec += 1
			elsif loop1 > 0
				initial += loop1
				total = total + (1000 + (loop1 * 100))
				totals_sec += 1
			end
		end
		if values.count(1) < 3
			loop1 = values.count(1)
			initial += loop1
			total = total + (loop1 * 100)
			total_sec += 1
		end
	end
	if values.count(5) > 0
		if values.count(5) >= 3
			loop1 = values.count(5) - 3
			if loop1 == 0
				initial += 3
				total += 500
				total_sec += 1
			elsif loop1 > 0
				initial += loop1
				total = total + (500 + (loop1 * 50))
				total_sec += 1
			end
		end
		if values.count(5) < 3
			loop1 = values.count(5)
			initial += loop1
			total = total + (loop1 * 50)
			total_sec += 1
		end
	end
	if values.count(2) > 0
		if values.count(2) == 3
			initial += 3
			total += 200
			total_sec += 1
		elsif values.count(2) < 3 || values.count(2) > 3
			count += values.count(2)
			loop2 += 1
		end
	end
	if values.count(3) > 0
		if values.count(3) == 3
			initial += 3
			total += 300
			total_sec += 1
		elsif values.count(3) < 3 || values.count(3) > 3
			count += values.count(3)
			loop2 += 1
		end
	end
	if values.count(4) > 0
		if values.count(4) == 3
			initial += 3
			total += 400
			total_sec += 1
		elsif values.count(4) < 3 || values.count(4) > 3
			count += values.count(4)
			loop2 += 1
		end
	end
	if values.count(6) > 0
		if values.count(6) == 3
			initial += 3
			total += 600
			total_sec += 1
		elsif values.count(6) < 3 || values.count(6) > 3
			count += values.count(6)
			loop2 += 1
		end
	end
	puts "\nTotal Score in this turn is: #{total}" 
	$counter += 1
	

	if total >= 300
		if total > $take
			$take = total
			$store[j-1] = total
			$check[j-1] = total
			if (count > 0 && total_sec > 0) || loop2 == 0
				puts "\nTotal Scoring Dice: #{initial}"
				puts "\nTotal Non-Scoring Dice: #{values.length - initial}"
				print "\nDo you wish to continue?(Y/N): "
				option = gets.chomp.to_s
				if option == "Y"
					rethrow(count, total, j)
				elsif option == "N"
					puts "\nYour score is: #{total}"
				else
					puts "\nInvalid Entry!"
				end
			end
			if count == 0
				points = {"one" => Random.new.rand(1..6), "two" => Random.new.rand(1..6), "three" => Random.new.rand(1..6), "four" => Random.new.rand(1..6), "five" => Random.new.rand(1..6)}
				values1 = []
				points.each do |key, value|
					values1.unshift(value)
				end
				#puts "\nAdditional Dice throw values are: #{values.inspect}"
				scoring(values1, total, j)
				$final = total
			else
			end
		elsif total == $take
			$store[j-1] = 0
		else
		end
	elsif total < 300
		#puts $final
		#puts total
			puts "\nTotal Scoring Dice: #{initial}"
		  	puts "\nTotal Non-Scoring Dice: #{values.length - initial}"
			puts "\nScore Less than 300. Next Turn!"
			$final = total
	else
	end
end

def rethrow(count, total, j)
	values = []
	(0...count).each do |i|
		values.unshift(Random.new.rand(1..6))
	end
	if values.size > 0
		puts "\nTurn values are: #{values.inspect}" 
	end
	scoring(values, total, j)
end

players
