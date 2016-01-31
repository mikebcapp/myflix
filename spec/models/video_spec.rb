require 'spec_helper'

describe Video do 
  it "saves itself" do
    video = Video.new(title: "Young Ones", description: "Classic old Brit comedy")
    video.save
    Video.first.title.should == "Young Ones"
  end
end