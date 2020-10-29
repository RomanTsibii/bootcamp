# frozen_string_literal: true

require 'rails_helper'

describe DepartmentsController, type: :controller do
  let!(:current_user) { create :user }

  before(:each) do
    sign_in(current_user)
  end

  describe '#show' do
    subject { get :show, params: { id: current_user.id } }

    it 'render show template if an item s found' do
      subject
      response.should render_template('show')
    end
  end
end
