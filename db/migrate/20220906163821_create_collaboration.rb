class CreateCollaboration < ActiveRecord::Migration[7.0]
  def change
    create_table :collaborations do |t|
      t.integer :author_id
      t.integer :article_id
    end
  end
end
