require 'rails_helper'

RSpec.describe UserNotesController, type: :controller do
  
  let(:user) { create(:user) }
  let(:note) { create(:note) }
  let(:reader) { create(:user) }

  context 'POST #create' do

    it 'should return a new user_note' do
      sign_in user
      params = { user_id: user.id, note_id: note.id, role: UserNote::roles.invert[0] }
      expect { post(:create, params: params) }.to change(UserNote, :count).by(1)
    end

    it 'should return a new user_note with role contributor if role contributor is passed' do
      sign_in reader
      params = { user_id: reader.id, note_id: note.id, role: UserNote::roles.invert[2] }
      post(:create, params: params)
      user_note = UserNote.where(:user_id => reader.id, :note_id => note.id).first
      expect(user_note.role).to eq("reader")
    end
  end

  context 'DELETE destroy' do
    let!(:user_note) { create(:user_note, user: user, note: note, role: UserNote::roles.invert[0]) }
    let!(:reader_user_note) { create(:user_note, user: reader, note: note, role: UserNote::roles.invert[2] ) }

      it 'should delete a user_note' do
        sign_in user
        params = {
                    user_id: reader.id,
                    note_id: note.id
                 }
        expect { delete(:destroy, params: params) }.to change(UserNote, :count).by(-1)
      end
  end

end
