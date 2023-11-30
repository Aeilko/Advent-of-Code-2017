require_relative '../lib/aoc'

module Day02
	extend AOC::Day

	@num = 2
	@ans_test1 = 18
	@ans_test2 = 9

	def self.solve_part1(input)
		r = 0
		input.lines.each { |line|
			nums = line.split.map(&:to_i)
			r += nums.max - nums.min
		}
		return r
	end

	def self.solve_part2(input)
		r = 0
		input.lines.each { |line|
			nums = line.split.map(&:to_i)
			nums.combination(2){ |pair|
				if pair.max % pair.min == 0
					r += (pair.max/pair.min)
					break
				end
			}
		}
		return r
	end
end

Day02.run
