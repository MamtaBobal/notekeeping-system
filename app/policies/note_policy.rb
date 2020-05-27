class NotePolicy
  attr_reader :user, :note

  def initialize(user, note)
    @user = user
    @note = note
  end

  def show?
    ["owner", "contributor", "reader"].include?(get_note_role)
  end

  def edit?
    update?
  end

  def update?
    ["owner", "contributor"].include?(get_note_role)
  end

  def destroy?
    ["owner"].include?(get_note_role)
  end

  def get_note_role
    @note.find_role(@user.id)
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
