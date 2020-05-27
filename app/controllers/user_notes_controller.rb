class UserNotesController < ApplicationController

  def create
    UserNote.create(:user_id => params[:user_id], :note_id => params[:note_id], :role => params[:role])
    render js: "window.location.reload()" and return
  end

  def destroy
    @user_event = UserNote.where(:user_id => params[:user_id], :note_id => params[:note_id]).first
    @user_event.destroy()
    render js: "window.location.reload()" and return
  end

end
