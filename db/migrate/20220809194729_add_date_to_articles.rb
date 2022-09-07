class AddDateToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :published, :date
  end
end
