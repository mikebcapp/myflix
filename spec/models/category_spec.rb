require 'spec_helper'

describe Category do 
  it { should have_many (:videos) }
end

describe "#recent_videos" do
  it "returns 6 videos when there are more than 6 videos in total" do
    comedies = Category.create(name: "comedies")
    futurama = Video.create(title: "Futurama", description: "Space Travel", category: comedies)
    southpark = Video.create(title: "SouthPark", description: "Crazy animated show", category: comedies)
    back_to_future = Video.create(title: "Back to Future", description: "Time Travel", category: comedies)
    futurama = Video.create(title: "Futurama", description: "Space Travel", category: comedies)
    southpark = Video.create(title: "SouthPark", description: "Crazy animated show", category: comedies)
    back_to_future = Video.create(title: "Back to Future", description: "Time Travel", category: comedies)
    futurama = Video.create(title: "Futurama", description: "Space Travel", category: comedies)
    expect(comedies.recent_videos.count).to eq(6)
  end

  it "returns the total number of videos  when there are less than 6 total videos" do
    comedies = Category.create(name: "comedies") 
    futurama = Video.create(title: "Futurama", description: "Space Travel", category: comedies)
    southpark = Video.create(title: "SouthPark", description: "Crazy animated show", category: comedies)
    back_to_future = Video.create(title: "Back to Future", description: "Time Travel", category: comedies)
    expect(comedies.recent_videos.count).to eq(3)
  end
  
  it "returns the videos in reverse chronological order ie, the most recent first" do
    comedies = Category.create(name: "comedies")
    futurama = Video.create(title: "Futurama", description: "Space Travel", category: comedies, created_at: 1.day.ago)
    southpark = Video.create(title: "SouthPark", description: "Crazy animated show", category: comedies, created_at: 5.day.ago)
    back_to_future = Video.create(title: "Back to Future", description: "Time Travel", category: comedies, created_at: 4.day.ago)
    expect(comedies.recent_videos).to eq([futurama, back_to_future, southpark])
  end
end
