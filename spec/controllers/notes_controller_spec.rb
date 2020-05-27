require 'rails_helper'

RSpec.describe NotesController, type: :controller do
  
  let(:user) { create(:user) }
  let(:contributor) { create(:user) }
  let(:reader) { create(:user) }

  context 'GET #index' do
    let(:note) { create(:note) }
    let(:params) { { id: note.id } }
    let!(:user_note) { create(:user_note, user: user, note: note, role: UserNote::roles.invert[0]) }

    it 'should return notes' do
      sign_in user
      get :index
      expect(response).to have_http_status(:success)
    end
  end


  context 'POST #create' do
    let(:params) { {
                     note: { description: "New Note" }
                  } }

    it 'should return a new note' do
      sign_in user
      expect { post(:create, params: params) }.to change(Note, :count).by(1)
    end

    it 'should set role as owner' do
      sign_in user
      post(:create, params: params)
      user_note = UserNote.where(:role => UserNote::roles.invert[0], :user_id => user.id)
      expect(user_note.count).to eq(1)
    end
  end


  context 'GET #show' do
    let(:note) { create(:note) }
    let(:params) { { id: note.id } }
    let!(:user_note) { create(:user_note, user: reader, note: note, role: UserNote::roles.invert[2]) }

    it 'should show note' do
      sign_in reader
      get :show, params: params
      expect(response).to have_http_status(:success)
    end
  end


  context 'PUT #update' do
    let(:note) { create(:note) }
    let(:params) { {
                     id: note.id,
                     note: { description: "Note Updated" }
                  } }

    context "owner should be able to update note" do
      let!(:user_note) { create(:user_note, user: user, note: note, role: UserNote::roles.invert[0]) }
      it 'should update a note' do
        sign_in user
        put :update, params: params
        note.reload
        expect(note.description).to eq("Note Updated")
      end
    end

    context "reader should not be able to update note" do
      let!(:user_note) { create(:user_note, user: reader, note: note, role: UserNote::roles.invert[2]) }
      it 'should not update a note' do
        sign_in user
        description = note.description
        put :update, params: params
        note.reload
        expect(note.description).to eq(description)
      end
    end
  end


  context 'DELETE destroy' do
    let!(:note) { create(:note) }

    context "owner will be able to delete note" do
      let!(:owner_user_note) { create(:user_note, user: user, note: note,
                                 role: UserNote::roles.invert[0]) }

        it 'should delete a note' do
          sign_in user
          params = { id: note.id }
          expect { delete(:destroy, params: params) }.to change(Note, :count).by(-1)
        end
    end

    context "contributor will not be able to delete note" do
      let!(:contributor_user_note) { create(:user_note, user: contributor, note: note,
                                 role: UserNote::roles.invert[1]) }

        it 'should delete a note' do
          sign_in contributor
          params = { id: note.id }
          expect { delete(:destroy, params: params) }.to change(Note, :count).by(0)
        end
    end
  end


end
