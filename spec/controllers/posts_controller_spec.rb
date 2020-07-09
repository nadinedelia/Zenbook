require 'rails_helper'
require_relative '../support/devise'

RSpec.describe PostsController, type: :controller do

  describe "GET /new " do
    it "responds with 302" do
      get :new
      expect(response).to have_http_status(302)
    end
  end

  describe "GET / " do
    login_user

    context 'from login user' do
      it "responds with 200" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end

  describe "POST /" do
    login_user
    it "responds with 200" do
      post :create, params: { post: { message: "Hello, world!" } }
      expect(response).to redirect_to(posts_url)
    end

    it "creates a post" do
      post :create, params: { post: { message: "Hello, world!" } }
      expect(Post.find_by(message: "Hello, world!")).to be
    end
  end

  describe "GET /" do
    login_user
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
