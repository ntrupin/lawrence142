class AddAuthorToArticle < ActiveRecord::Migration[7.0]
  def change
    add_reference :articles, :author, null: true, foreign_key: true
  end
end
