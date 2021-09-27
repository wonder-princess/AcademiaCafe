require 'rails_helper'

RSpec.describe ToppagesController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #userpolicy" do
    it "returns http success" do
      get :userpolicy
      expect(response).to have_http_status(:success)
    end
  end

end
