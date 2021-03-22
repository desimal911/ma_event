class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.text :title
      t.text :body
      t.text :author
      t.text :media
      t.datetime :published_at
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
