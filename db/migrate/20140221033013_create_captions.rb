class CreateCaptions < ActiveRecord::Migration
  def change
    create_table :captions do |t|
      t.text :body
      t.belongs_to :user
      t.belongs_to :image
      t.integer :score, default: 0
      t.timestamps
    end
  end
end
