module AOC
	module Day
		# Settings
		attr_accessor :num, :ans_test1, :ans_test2

		# Instance variables
		attr_accessor :input, :test_input, :test_input1, :test_input2

		def run
			setup
			run_part 1
			run_part 2
		end

		def setup
			attr_defaults

			# Load inputs
			if @input.nil?
				# Load input used
				# TODO
				@input = "input"
			end
			if @test_input.nil? and not (@ans_test1.nil? and @ans_test2.nil?)
				# Load test input
				# TODO
				@test_input = "test"
			end
		end

		def run_part(part)
			puts " --- Running day #{@num}, part #{part} --- ".yellow

			# Check if the solve_partX method is implemented
			unless self.respond_to?("solve_part#{part}")
				puts "This part has not been implemented".red
				return
			end

			# Run test if configured
			ans_test = self.send("ans_test#{part}")
			if not ans_test.nil? and not @test_input.nil?
				test = self.send("solve_part#{part}", @test_input)

				if test != ans_test
					puts "Test failed, result '#{test}', expected '#{ans_test}'".red
					return
				end

				puts "Test successful".green
			end

			# Solve this part
			result = self.send("solve_part#{part}", @input)
			puts "Result: #{result}"
		end

		def attr_defaults
			@num = 0 if @num.nil?
		end
	end
end

class String
	def red;	"\e[31m#{self}\e[0m" end
	def green;	"\e[32m#{self}\e[0m" end
	def yellow;	"\e[33;1m#{self}\e[0m" end
end
