require 'rails_helper'

RSpec.describe IdeasController, type: :controller do
  render_views # so that templates are rendered

  describe 'GET #index' do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "does not show naughty words on index" do
      idea = Idea.create!(name: "Have a poop", description: "It is full of beans!")
      get :index
      expect(response).to render_template("index")
      expect(response.body).to_not include("poop")
      expect(response.body).to include("heck")
    end

    it "can show an idea" do
      idea = Idea.create!(name: "Drink soy milk", description: "It is full of beans!")
      get :show, params: { id: idea.id }
      expect(response).to render_template("show")
      expect(response.body).to include("Drink soy milk")
      expect(response.body).to include(idea.description)
    end

    it "can show an idea with a naughty word" do
      idea = Idea.create!(name: "Have a poop", description: "It is full of beans!")
      get :show, params: { id: idea.id }
      expect(response).to render_template("show")
      expect(response.body).to include("Have a heck")
      expect(response.body).to include(idea.description)
    end
  end
end
