class NotePolicy
  attr_reader :user, :note

  def initialize(user, note)
    @user = user
    @note = note
  end

  def show?
    ["owner", "contributor", "reader"].include?(@note.find_role(@user.id))
  end

  def edit?
    update?
  end

  def update?
    ["owner", "contributor"].include?(@note.find_role(@user.id))
  end

  def destroy?
    ["owner"].include?(@note.find_role(@user.id))
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
