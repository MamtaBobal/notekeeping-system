class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  def index
    @notes = policy_scope(Note).paginate(page: params[:page], per_page: 15)
  end
  
  def new
    @note = Note.new
  end

  def show
  end

  def create
    @note = Note.new(notes_params)
    if @note.save
      current_user.user_notes.create(note_id: @note.id, role: UserNote::roles.invert[0])
      respond_to do |format|
        format.html { redirect_to notes_path, notice: 'Note was successfully created.' }
      end
    else
      render 'edit'
    end
  end

  def edit
  end

  def update
    if @note.update(notes_params)
      respond_to do |format|
        format.html { redirect_to notes_path, notice: 'Note was successfully updated.' }
      end
    else
      render 'edit'
    end
  end

  def destroy
    @note.destroy()
    redirect_to notes_path, notice: 'Note was successfully deleted.'
  end

  private

  def notes_params
    params.require(:note).permit(:description)
  end

  def set_note
    @note = Note.find(params[:id])
    authorize @note
  end

end