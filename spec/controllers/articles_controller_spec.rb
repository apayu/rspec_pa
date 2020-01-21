require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe "GET show" do
    it "assgins @article" do
      article = create(:article)

      # 這段test會傳 parameters { "id" => "1" }，所以 action 那邊實作一定要找出 id = 1
      get :show, params: { id: article.id }

      expect(assigns[:article]).to eq(article)
    end

    it "render show template" do
      article = create(:article)

      get :show, params: { id: article.id }

      expect(response).to render_template("show")
    end
  end

  describe "GET index" do
    it "assgins @articles" do
      article1 = create(:article)
      article2 = create(:article)

      get :index

      expect(assigns[:articles]).to eq([article1, article2])
    end

    it "render index template" do
      article1 = create(:article)
      article2 = create(:article)

      get :index

      expect(response).to render_template("index")
    end
  end
end
