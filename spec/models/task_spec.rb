require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:task) { FactoryBot.create(:task) }

  context 'validations' do
    context 'title' do
      it { expect(task).to validate_presence_of(:title) }
    end

    context 'level' do
      it { expect(task).to validate_presence_of(:level) }
    end
  end

  context 'associations' do
    it { expect(task).to have_many(:comments) }
    it { expect(task).to belong_to(:flow_step) }
    it { expect(task).to belong_to(:development_plan) }
  end
end
