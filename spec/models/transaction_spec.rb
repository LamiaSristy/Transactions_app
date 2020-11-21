require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe "validations" do
    let(:transaction) { FactoryBot.build(:transaction) }
    it "should have a title" do
      transaction.name = nil
      expect(transaction).to_not be_valid
    end
    it "should have a amount" do
      transaction.amount = nil
      expect(transaction).to_not be_valid
    end
  end
  describe 'Associations' do
    it { should belong_to(:author) }
  end
end
