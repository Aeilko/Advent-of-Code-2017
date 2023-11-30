require_relative '../lib/aoc'

module Day01
	extend AOC::Day

	@num = 1
	@ans_test1 = 3
	@ans_test2 = 4

	def self.solve_part1(input)
		input = input.split[0]

		r = 0
		(0..input.length).each { |i|
			r += input[i].to_i if input[i] == input[(i + 1) % input.length]
		}
		return r
	end

	def self.solve_part2(input)
		input = input.split[0]

		step = input.length/2
		r = 0
		(0..input.length).each { |i|
			r += input[i].to_i if input[i] == input[(i + step) % input.length]
		}
		return r
	end
end

Day01.run
