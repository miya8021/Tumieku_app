class RenameTypeColumnToExercises < ActiveRecord::Migration[6.1]
  def change
    rename_column :exercises, :type, :name
  end
end