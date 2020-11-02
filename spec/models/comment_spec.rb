require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment) { FactoryBot.create(:comment) }

  context 'validations' do
    context 'content' do
      it { expect(comment).to validate_presence_of(:content) }
    end
  end

  context 'associations' do
    it { expect(comment).to belong_to(:task) }
    it { expect(comment).to belong_to(:commentable) }
  end
end
