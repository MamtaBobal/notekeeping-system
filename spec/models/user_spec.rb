require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { create(:user) }

  context "factory" do
    let(:user) { build(:user) }

    it "has a valid factory" do
      expect(user).to be_valid
    end
  end

  context "associations" do
    it { expect(user).to have_many(:user_notes).dependent(:destroy) }
    it { expect(user).to have_many(:notes).through(:user_notes).dependent(:destroy) }
  end

end
