require 'spec_helper'

describe Video do 
  it { belong_to (:category)}
    

  it "does not save a video without a title" do
    video = Video.create(description: "A great video")
    expect(Video.count).to eq(0)
  end

  it "does not save a video without a description" do
    video = Video.create(title: "Southpark")
    expect(Video.count).to eq(0)
  end

  
end