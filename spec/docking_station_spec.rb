
require "docking_station.rb"

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it "releases working bike" do
    subject.dock Bike.new
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it { is_expected.to respond_to(:dock).with(1).argument}

  it "raises an error when docking station is empty" do
    expect {subject.release_bike}.to raise_error "No bikes available."
  end

 it "raises an error when docking station is full" do
    20.times {subject.dock Bike.new}
    expect {subject.dock Bike.new}.to raise_error "Station is full."
  end

  it "has default capacity" do
    expect {subject.capacity}.to eq DockingStation::DEFAULT_CAPACITY
  end


end






# describe DockingStation do
#   it "responds to release_bike" do
#   expect(subject).to respond_to :release_bike
# end
