class CreateArtices < ActiveRecord::Migration[6.1]
  def change
    create_table :artices do |t|
      t.date :day, null: false
      t.integer :minutes, null: false
      t.text :body, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end