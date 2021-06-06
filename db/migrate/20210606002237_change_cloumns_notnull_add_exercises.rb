class ChangeCloumnsNotnullAddExercises < ActiveRecord::Migration[6.1]
  def change
    change_column :exercises, :name, :string, null: false
  end
end
