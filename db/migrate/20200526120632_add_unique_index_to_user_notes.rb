class AddUniqueIndexToUserNotes < ActiveRecord::Migration[6.0]
  def change
    add_column :user_notes, :role, :integer
    add_index :user_notes, [:note_id, :user_id], unique: true
  end
end
