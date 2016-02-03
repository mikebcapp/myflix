require 'spec_helper'

describe Category do 
  it 'saves itself' do
    category = Category.new(name: "Comedy")
    category.save
    expect(Category.first.name).to eq("Comedy")
  end

  it 'has many videos' do
    comedies = Category.create(name: "comedies")
    south_park = Video.create(title: "South Park", description: "Funny adult animated show", category: comedies)
    futurama = Video.create(title: "Futurama", description: "Funny space animated show", category: comedies)
    expect(comedies.videos).to include(futurama, south_park)
  end

end