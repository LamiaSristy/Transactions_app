require 'rails_helper'

RSpec.describe Group, type: :model do
  describe "validations" do
    let(:group) { FactoryBot.build(:group) }
    it "should have a title" do
      group.name = nil
      expect(group).to_not be_valid
    end
  end
  describe 'Associations' do
    it { should belong_to(:user) }
  end
end
