class ChangeCloumnsNotnullAddUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :name, :string, null: false
    change_column :users, :objective, :string, null: false
  end
end