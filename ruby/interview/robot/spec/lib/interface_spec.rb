require "interface"

RSpec.describe Interface do
	before :each do
		@interface = Interface.new
	end

	context 'verify place command' do

		it "'PLACE 0,0,NORTH' is a place command" do
			expect(@interface.is_place?("PLACE 0,0,NORTH")).to eq (true)
		end

		it "'PLACE 100,100,NORTH' is a place command" do
			expect(@interface.is_place?("PLACE 100,100,NORTH")).to eq (true)
		end

		it "'place 0,0,NORTH' is not a place command" do
			expect(@interface.is_place?("place 0,0,NORTH")).to eq (false)
		end

		it "'PLACE 0,0,DIR' is not a place command" do
			expect(@interface.is_place?("PLACE 0,0,DIR")).to eq (false)
		end

		it "'PLACE 0,NORTH' is not a place command" do
			expect(@interface.is_place?("PLACE 0,NORTH")).to eq (false)
		end

		it "'PLACE 0, 0, NORTH' is not a place command" do
			expect(@interface.is_place?("PLACE 0, 0, NORTH")).to eq (false)
		end
	end

	context 'verify move command' do

		it "'MOVE' is a move command" do
			expect(@interface.is_move?("MOVE")).to eq (true)
		end
		it "'move' is not a move command" do
			expect(@interface.is_move?("move")).to eq (false)
		end
	end

	context 'verify left command' do

		it "'LEFT' is a left command" do
			expect(@interface.is_left?("LEFT")).to eq (true)
		end
		it "'left' is not a left command" do
			expect(@interface.is_left?("left")).to eq (false)
		end
	end

	context 'verify right command' do

		it "'RIGHT' is a right command" do
			expect(@interface.is_right?("RIGHT")).to eq (true)
		end
		it "'right' is not a right command" do
			expect(@interface.is_right?("right")).to eq (false)
		end
	end

	context 'verify report command' do

		it "'REPORT' is a report command" do
			expect(@interface.is_report?("REPORT")).to eq (true)
		end
		it "'report' is not a report command" do
			expect(@interface.is_report?("report")).to eq (false)
		end
	end

	context 'Check read file' do

		it "'./input_folder/input.txt'(normal input) can be read" do
			expect(@interface.read_file("./input_folder/input.txt")).to eq (["PLACE 0,0,NORTH", "MOVE", "REPORT"])
		end

		it "'./input_folder/input.txt'(input with out place command) can be read" do
			expect(@interface.read_file("./input_folder/input4.txt")).to eq (["MOVE", "LEFT", "MOVE", "MOVE", "LEFT", "MOVE", "REPORT"])
		end

		it "input file with wrong name can not be read" do
			expect(@interface.read_file("wrong_name")).to eq ("Error: file do not exist.")
		end

		it "'./input_folder/input5.txt'(invalid command in the input file) invalid command can be ignore" do
			expect(@interface.read_file("./input_folder/input5.txt")).to eq (["PLACE 1,2,EAST", "MOVE", "MOVE", "LEFT", "MOVE", "REPORT"])
		end

		it "'./input_folder/input6.txt'(empty file) can be read to an empty array" do
			expect(@interface.read_file("./input_folder/input6.txt")).to eq ([])
		end
	end
end