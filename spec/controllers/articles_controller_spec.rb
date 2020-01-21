require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe "POST new" do
    context "當沒有打標題時" do
      it "不能存資料庫" do
        expect do
          post :create, params: { :article => { :description => "#{Faker::Lorem.paragraphs}" }}
        end.to change{ Article.count }.by(0)
      end

      it "回到 new.html.erb 頁面" do
        post :create, params: { :article => { :description => "#{Faker::Lorem.paragraphs}" }}

        expect(response).to render_template("new")
      end
    end

    context "有標題時" do
      it "create a new record" do
        article = build(:article)

        expect do
          post :create, params: { :article => attributes_for(:article) }
        end.to change{ Article.count }.by(1)
      end

      it "redirect to articles_path" do
        article = build(:article)

        post :create, params: { :article =>attributes_for(:article) }

        expect(response).to redirect_to articles_path
      end
    end
  end

  describe "GET new"  do
    it "assigns @article" do
      article = build(:article)

      get :new

      expect(assigns[:article]).to be_a_new(Article)
    end

    it "render template new" do
      article = build(:article)

      get :new

      expect(response).to render_template("new")
    end
  end

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
