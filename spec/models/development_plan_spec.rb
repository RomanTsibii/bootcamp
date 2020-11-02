require 'rails_helper'

RSpec.describe DevelopmentPlan, type: :model do
  let(:development_plan) { FactoryBot.create(:development_plan) }

  context 'validations' do
    context 'title' do
      it { expect(development_plan).to validate_presence_of(:title) }
    end
  end

  context 'associations' do
    it { expect(development_plan).to have_many(:flow_steps) }
    it { expect(development_plan).to have_many(:tasks) }
    it { expect(development_plan).to belong_to(:department) }
  end
end
