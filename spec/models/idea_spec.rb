describe Idea do
  it "has a name" do
    idea = Idea.create!(name: "Hello")
    expect(idea.name).to eq("Hello")
  end

  it "can change its name" do
    idea = Idea.create!(name: "Jim")
    idea.name = "Jill"
    expect(idea.name).to eq("Jill")
  end
end
