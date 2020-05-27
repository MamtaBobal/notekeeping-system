# == Schema Information
#
# Table name: notes
#
#  id          :integer          not null, primary key
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe Note, type: :model do

  let(:note) { create(:note) }

  context "factory" do
    let(:note) { build(:note) }

    it "has a valid factory" do
      expect(note).to be_valid
    end
  end

  context "validations" do
    it { should validate_presence_of(:description) }
  end

  context "associations" do
    it { expect(note).to have_many(:user_notes).dependent(:destroy) }
    it { expect(note).to have_many(:users).through(:user_notes) }
  end

  context "public instance methods" do
    context "responds to its methods" do
      it { expect(note).to respond_to(:find_role) }
    end

    context "executes methods correctly" do
      context "find_role" do
        let(:user) { create(:user) }
        let(:note) { create(:note) }

        context "returns owner if user is an owner of the note" do
          let!(:user_note) { create(:user_note, user_id: user.id, note_id: note.id,
                                       role: UserNote::roles.invert[0])
                           }
          it "returns owner" do
            expect(note.find_role(user.id)).to eq("owner")
          end
        end

        context "returns contributor if user is a contributor of the note" do
          let!(:user_note) { create(:user_note, user_id: user.id, note_id: note.id,
                                       role: UserNote::roles.invert[1])
                           }
          it "returns contributor" do
            expect(note.find_role(user.id)).to eq("contributor")
          end
        end

        context "returns reader if user is a reader of the note" do
          let!(:user_note) { create(:user_note, user_id: user.id, note_id: note.id,
                                       role: UserNote::roles.invert[2])
                           }
          it "returns contributor" do
            expect(note.find_role(user.id)).to eq("reader")
          end
        end
      end
    end
  end
end
