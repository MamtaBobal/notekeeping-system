class ChangeDescriptionColumnType < ActiveRecord::Migration[6.0]
  def up
    change_column :notes, :description, :text
  end

  def down
    change_column :notes, :description, :string
  end
end
