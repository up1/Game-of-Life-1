require 'live_cell'
require 'dead_cell'

describe LiveCell do

  context "dies when" do
    it "has 0 live neighbors" do
      LiveCell.new.alive_next_iteration?(0).should be_an_instance_of DeadCell
    end
    
    it "has 1 live neighbors" do
      LiveCell.new.alive_next_iteration?(1).should be_an_instance_of DeadCell
    end

    4.upto(8) do |n|
      it "has #{n} live neighbors" do
        LiveCell.new.alive_next_iteration?(n).should be_an_instance_of DeadCell
      end
    end
  end

  context "lives when" do
    it "has 2 live neighbors" do
      LiveCell.new.alive_next_iteration?(2).should be_an_instance_of LiveCell
    end

    it "has 3 live neighbors" do
      LiveCell.new.alive_next_iteration?(3).should be_an_instance_of LiveCell
    end
  end
  
  it "tells a visitor to visit a live cell" do
    mock_visitor = Object.new
    live_cell = LiveCell.new
    mock_visitor.should_receive(:visit_live_cell).with(live_cell)

    live_cell.accept_visitor(mock_visitor)
  end
end
