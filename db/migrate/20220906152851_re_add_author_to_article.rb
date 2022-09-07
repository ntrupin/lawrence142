class ReAddAuthorToArticle < ActiveRecord::Migration[7.0]
  def change
    remove_column :articles, :author_id
    add_reference :articles, :author, null: true, foreign_key: true
  end
end
