class AddSectionToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :section, :string
  end
end
