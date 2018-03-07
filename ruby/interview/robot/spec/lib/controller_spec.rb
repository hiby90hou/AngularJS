require "controller"

RSpec.describe Controller do
	before :each do
		@controller = Controller.new(5,5)
	end

	context 'direction translate' do
		
		it "'NORTH' direction can be translate to '0'" do
			expect(@controller.direction_translate("NORTH")).to eq (0)
		end

		it "'EAST' direction can be translate to '90'" do
			expect(@controller.direction_translate("EAST")).to eq (90)
		end

		it "'SOUTH' direction can be translate to '180'" do
			expect(@controller.direction_translate("SOUTH")).to eq (180)
		end

		it "'WEST' direction can be translate to '270'" do
			expect(@controller.direction_translate("WEST")).to eq (270)
		end
	end

	context 'check data processing' do
		it "return same data by default" do
			expect(@controller.data_processing(["PLACE 1,2,EAST", "MOVE", "MOVE", "LEFT", "MOVE", "REPORT"])).to eq (["PLACE 1,2,EAST", "MOVE", "MOVE", "LEFT", "MOVE", "REPORT"])
		end

		it "ignore other command before first place command" do
			expect(@controller.data_processing([ "MOVE", "MOVE","PLACE 1,2,EAST", "LEFT", "MOVE", "REPORT"])).to eq (["PLACE 1,2,EAST", "LEFT", "MOVE", "REPORT"])
		end

		it "if data is not an array, report error 'ERROR: invalid command'" do
			expect(@controller.data_processing("Error: file do not exist.")).to eq ("ERROR: invalid command")
		end

		it "if data do not contain place command, report error 'ERROR: user did not place robot on table'" do
			expect(@controller.data_processing([ "MOVE", "MOVE", "LEFT", "MOVE", "REPORT"])).to eq ("ERROR: user did not place robot on table")
		end
	end

	context 'robot state check' do

		it "robot must be place on the table" do
			expect(@controller.valid_place?(0,0)).to eq (true)
		end

		it "robot place is invalid when not on the table" do
			expect(@controller.valid_place?(5,5)).to eq (false)
		end

		it "robot in (0,0) can go north" do
			expect(@controller.can_go_north?(0,0)).to eq (true)
		end

		it "robot in (0,4) cannot go north because it touch boundary" do
			expect(@controller.can_go_north?(0,4)).to eq (false)
		end

		it "robot in (0,0) can go east" do
			expect(@controller.can_go_east?(0,0)).to eq (true)
		end

		it "robot in (4,0) cannot go east because it touch boundary" do
			expect(@controller.can_go_east?(4,0)).to eq (false)
		end

		it "robot in (0,4) can go south" do
			expect(@controller.can_go_south?(0,4)).to eq (true)
		end

		it "robot in (0,0) cannot go south because it touch boundary" do
			expect(@controller.can_go_south?(0,0)).to eq (false)
		end

		it "robot in (4,0) can go west" do
			expect(@controller.can_go_west?(4,0)).to eq (true)
		end

		it "robot in (0,0) cannot go south because it touch boundary" do
			expect(@controller.can_go_west?(0,0)).to eq (false)
		end

		it "robot place can be show as {:x=>0, :y=>0, :dir=>'NORTH'} before user place robot" do
			expect(@controller.show_place()).to eq ({:x=>0, :y=>0, :dir=>"NORTH"})
		end

		it "robot place can be show as {:x=>1, :y=>0, :dir=>'NORTH'} after user place robot in 1,0,'NORTH'" do
			@controller.place_robot(1, 0, 'NORTH')
			expect(@controller.show_place()).to eq ({:x=>1, :y=>0, :dir=>"NORTH"})
		end
	end

	context 'robot behavior' do

		it "place robot in (1, 0, 'NORTH') is valid" do
			expect(@controller.place_robot(1, 0, 'NORTH')).to eq ({:x=>1, :y=>0, :dir=>"NORTH"})
		end

		it "place robot in (6, 6, 'NORTH') is invalid because it out of boundary" do
			expect(@controller.place_robot(6, 6, 'NORTH')).to eq ("Error: Invalid place")
		end

		it "robot in (0, 0, 'NORTH') can move to next block" do
			@controller.place_robot(0, 0, 'NORTH')
			expect(@controller.move).to eq ({:x=>0, :y=>1, :dir=>"NORTH"})
		end

		it "when try to move robot in (0, 4, 'NORTH'), it will stay at the same block" do
			@controller.place_robot(0, 4, 'NORTH')
			expect(@controller.move).to eq ({:x=>0, :y=>4, :dir=>"NORTH"})
		end

		it "robot in (0, 0, 'EAST') can move to next block" do
			@controller.place_robot(0, 0, 'EAST')
			expect(@controller.move).to eq ({:x=>1, :y=>0, :dir=>"EAST"})
		end

		it "when try to move robot in (0, 4, 'EAST'), it will stay at the same block" do
			@controller.place_robot(4, 0, 'EAST')
			expect(@controller.move).to eq ({:x=>4, :y=>0, :dir=>"EAST"})
		end

		it "robot in (0, 1, 'SOUTH') can move to next block" do
			@controller.place_robot(0, 1, 'SOUTH')
			expect(@controller.move).to eq ({:x=>0, :y=>0, :dir=>"SOUTH"})
		end

		it "when try to move robot in (0, 0, 'SOUTH'), it will stay at the same block" do
			@controller.place_robot(0, 0, 'SOUTH')
			expect(@controller.move).to eq ({:x=>0, :y=>0, :dir=>"SOUTH"})
		end

		it "robot in (1, 0, 'WEST') can move to next block" do
			@controller.place_robot(1, 0, 'WEST')
			expect(@controller.move).to eq ({:x=>0, :y=>0, :dir=>"WEST"})
		end

		it "when try to move robot in (0, 0, 'WEST'), it will stay at the same block" do
			@controller.place_robot(0, 0, 'WEST')
			expect(@controller.move).to eq ({:x=>0, :y=>0, :dir=>"WEST"})
		end

		it "robot in (0, 0, 'SOUTH') will face EAST after the turn left command" do
			@controller.place_robot(0, 0, 'SOUTH')
			expect(@controller.turn("LEFT")).to eq ({:x=>0, :y=>0, :dir=>"EAST"})
		end

		it "robot in (0, 0, 'NORTH') will face EAST after the turn right command" do
			@controller.place_robot(0, 0, 'NORTH')
			expect(@controller.turn("RIGHT")).to eq ({:x=>0, :y=>0, :dir=>"EAST"})
		end
	end
	
end