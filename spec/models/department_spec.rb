require 'rails_helper'

RSpec.describe Department, type: :model do
  let(:department) { FactoryBot.create(:department) }

  context 'validations' do
    context 'title' do
      it { expect(department).to validate_presence_of(:title) }
    end
  end

  context 'associations' do
    it { expect(department).to have_many(:users) }
    it { expect(department).to have_many(:development_plans) }
  end
end
