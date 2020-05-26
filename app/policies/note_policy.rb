class NotePolicy
  attr_reader :user, :note

  def initialize(user, note)
    @user = user
    @note = note
  end

  def edit?
    update?
  end

  def update?
    user_role = @user.user_notes.where(note_id: @note.id).first
    ["owner", "contributor"].include?(user_role.role)
  end

  def destroy?
    user_role = @user.user_notes.where(note_id: @note.id).first
    ["owner"].include?(user_role.role)
  end

  class Scope
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      @user.notes
    end
  end
end
