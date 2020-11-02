require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }

  context 'validations' do
    context 'first name' do
      it { expect(user).to validate_presence_of(:first_name) }
    end
    context 'last name' do
      it { expect(user).to validate_presence_of(:last_name) }
    end
    context 'email' do
      it { expect(user).to validate_presence_of(:email) }
      it { expect(user).to validate_uniqueness_of(:email).ignoring_case_sensitivity }
    end
  end

  context 'associations' do
    it { expect(user).to have_many(:comments) }
    it { expect(user).to belong_to(:department) }
  end
end
