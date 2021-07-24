class ChangeArticesToArticles < ActiveRecord::Migration[6.1]
  def change
    rename_table :artices, :articles
  end
end
