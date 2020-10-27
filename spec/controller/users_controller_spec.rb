require 'rails_helper'

describe UsersController, type: :controller do
  before(:each) do
    sign_in(create(:user))
  end

  describe '#index' do
    let!(:user) { create :user }
    subject { get :index }

    it 'return all users' do
      subject
      expect(assigns(:users)).to eq(User.order(:id))
    end

    it 'render index' do
      subject
      expect(response).to render_template(:index)
    end

    it 'status 200' do
      subject
      expect(response).to have_http_status(200)
    end
  end
end
