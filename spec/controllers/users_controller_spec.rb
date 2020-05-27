require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  
  context 'GET #index' do
    let(:user) { create(:user) }
    let(:reader) { create(:reader) }
    let(:note) { create(:note) }
    let!(:user_note) { create(:user_note, user: user, note: note, role: UserNote::roles.invert[0]) }
    let(:params) { { note_id: note.id } }

    it 'should success' do
      sign_in user
      get :index, params: params
      expect(response).to have_http_status(:ok)
    end
  end
end
