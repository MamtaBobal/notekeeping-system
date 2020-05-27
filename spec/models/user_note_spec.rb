require 'rails_helper'

RSpec.describe UserNote, type: :model do

  let(:user_note) { create(:user_note) }

  context "factory" do
    let(:user_note) { build(:user_note) }

    it "has a valid factory" do
      expect(user_note).to be_valid
    end
  end

  context "associations" do
    it { expect(user_note).to belong_to(:note) }
    it { expect(user_note).to belong_to(:user) }
  end

  context "Role enum" do
    it { should define_enum_for(:role).with_values([:owner, :contributor, :reader]) }
  end
end
