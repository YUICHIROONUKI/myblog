require 'rails_helper'

describe ArticlesController do
  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "assign the requested article to @article" do
      user = create(:user, id: "1")
      article = create(:article)
      get :edit, params: { id: article }
      expect(assigns(:article)).to eq article
    end

    it "renders the :edit template" do
      user = create(:user, id: "1")
      article = create(:article)
      get :edit, params: {id: article}
      expect(response).to render_template :edit
    end
  end

  describe 'GET #index' do
    it "assign the requested article to @articles" do
      user = create(:user, id: "1")
      articles = create_list(:article, 3)
      get :index
      expect(assigns(:articles)).to match(articles)
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end
end