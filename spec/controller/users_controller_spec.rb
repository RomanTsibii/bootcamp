require 'rails_helper'

describe UsersController, type: :controller do
  let!(:current_user) { create :user }

  before(:each) do
    sign_in(current_user)
  end

  describe '#index' do
    subject { get :index }

    it 'return all users' do
      subject
      expect(assigns(:users)).to eq(User.order(:id))
    end
  end

  describe '#show' do
    subject { get :show, params: { id: current_user.id } }

    before(:each) do
      subject
    end

    it 'should return success' do
      expect(response).to have_http_status(200)
    end

    it 'should render show view' do
      expect(response).to render_template('show')
    end

    it 'should return new user object' do
      expect(assigns(:user).id).to eq(current_user.id)
    end
  end

  describe 'edit' do
    subject { get :edit, params: { id: current_user.id } }

    before(:each) do
      subject
    end

    it 'should return new user object' do
      expect(assigns(:user)).to eq(current_user)
    end
  end

  describe 'update' do
    subject { put :update, params: { id: current_user.id, first_name: 'Updated' } }

    before(:each) do
      subject
    end

    it 'should return success' do
      expect(response).to have_http_status(302)
    end

    it 'should update user' do
      expect(current_user.reload.first_name).to eq('Updated')
    end
  end

  describe 'destroy' do
    subject { delete :destroy, params: { id: current_user.id } }

    it 'should return success' do
      subject
      expect(response).to have_http_status(302)
    end

    it 'should update user' do
      users_count = User.all.count
      subject
      expect(User.all.count).to eq(users_count - 1)
    end
  end
end
