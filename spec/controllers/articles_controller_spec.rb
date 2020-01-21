require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe "GET index" do
    it "assgins @articles" do
      article1 = create(:article)
      article2 = create(:article)

      get :index

      expect(assigns[:articles]).to eq([article1, article2])
      expect(response).to render_template("index")
    end
  end
end
