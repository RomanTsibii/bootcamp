require 'rails_helper'

RSpec.describe "FlowSteps", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/flow_steps/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/flow_steps/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/flow_steps/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/flow_steps/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
