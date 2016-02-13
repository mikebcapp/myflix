require 'spec_helper'

describe Video do 
  it { should belong_to (:category) }
  it { should validate_presence_of (:title) }
  it { should validate_presence_of (:description) }
end

describe "search_by_title" do
  it "returns an empty array if there is no match" do
    futurama = Video.create(title: "Futurama", description: "Space Travel")
    back_to_future = Video.create(title: "Back to Future", description: "Time Travel")
    expect(Video.search_by_title("hello")).to eq([])
  end
 it "returns an array of one video for an exact match" do
    futurama = Video.create(title: "Futurama", description: "Space Travel")
    back_to_future = Video.create(title: "Back to Future", description: "Time Travel")
    expect(Video.search_by_title("Futurama")).to eq([futurama])
  end
  it "returns an array of one video for a partial match" do
    futurama = Video.create(title: "Futurama", description: "Space Travel")
    back_to_future = Video.create(title: "Back to Future", description: "Time Travel")
    expect(Video.search_by_title("urama")).to eq([futurama] )
  end
  it "returns an array of all matches ordered by created_at" do
    futurama = Video.create(title: "Futurama", description: "Space Travel", created_at: 1.day.ago)
    back_to_future = Video.create(title: "Back to Future", description: "Time Travel")
    expect(Video.search_by_title("Futur")).to eq([back_to_future, futurama])
  end   
  it "returns an empty array for a search with an empty string" do
    futurama = Video.create(title: "Futurama", description: "Space Travel", created_at: 1.day.ago)
    back_to_future = Video.create(title: "Back to Future", description: "Time Travel")
    expect(Video.search_by_title("")).to eq([])
  end     
end

describe "Most recent 6 videos" do
  it "returns 6 videos when there are more than 6 videos in total" do
    futurama=Video.create(title: "Futurama", description: "Space Travel")
    southpark=Video.create(title: "SouthPark", description: "Crazy animated show")
    back_to_future = Video.create(title: "Back to Future", description: "Time Travel")
    futurama=Video.create(title: "Futurama", description: "Space Travel")
    southpark=Video.create(title: "SouthPark", description: "Crazy animated show")
    back_to_future = Video.create(title: "Back to Future", description: "Time Travel")
    futurama=Video.create(title: "Futurama", description: "Space Travel")
    expect(Video.recent_videos.count).to eq(6)
  end
  it "returns the total number of videos  when there are less than 6 total videos" do 
    futurama=Video.create(title: "Futurama", description: "Space Travel")
    southpark=Video.create(title: "SouthPark", description: "Crazy animated show")
    back_to_future = Video.create(title: "Back to Future", description: "Time Travel")
    expect(Video.recent_videos.count).to eq(3)
  end
  it "returns the videos in reverse chronological order ie, the most recent first" do
    futurama = Video.create(title: "Futurama", description: "Space Travel", created_at: 1.day.ago)
    southpark = Video.create(title: "SouthPark", description: "Crazy animated show", created_at: 5.day.ago)
    back_to_future = Video.create(title: "Back to Future", description: "Time Travel", created_at: 4.day.ago)
    expect(Video.recent_videos).to eq([futurama,back_to_future, southpark])
  end

end