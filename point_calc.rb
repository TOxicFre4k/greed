class PointCalculator
    def calc(values)
        @score = 0
        @score += 1000 + ((values.count(1) - 3) * 100) if values.count(1) >= 3
        @score += 500 + ((values.count(5) - 3) * 50) if values.count(5) >= 5
        @score += 200 if values.count(2) >= 3
        @score += 300 if values.count(3) >= 3
        @score += 400 if values.count(4) >= 3
        @score += 600 if values.count(6) >= 3
        @score += (values.count(1) * 100) if values.count(1) < 3
        @score += (values.count(5) * 50) if values.count(5) < 3
        @scoring = scoring_dies(values)
        @non_scoring = values.length - @scoring
        puts "\nScoring Dies: #{@scoring}"
        puts "\nNon-Scoring Dies: #{@non_scoring}"
        return @score, @scoring, @non_scoring
    end

    def scoring_dies(values)
        @count = 0
        @count += values.count(1) + values.count(5)
        @count += values.count(2) if values.count(2) - 3 == 0
        @count += values.count(3) if values.count(3) - 3 == 0
        @count += values.count(4) if values.count(4) - 3 == 0
        @count += values.count(6) if values.count(6) - 3 == 0
        return @count
    end
end
