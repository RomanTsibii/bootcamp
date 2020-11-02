require 'rails_helper'

RSpec.describe FlowStep, type: :model do
  let(:flow_step) { FactoryBot.create(:flow_step) }

  context 'validations' do
    context 'title' do
      it { expect(flow_step).to validate_presence_of(:title) }
    end
  end

  context 'associations' do
    it { expect(flow_step).to have_many(:tasks) }
    it { expect(flow_step).to belong_to(:development_plan) }
  end
end
