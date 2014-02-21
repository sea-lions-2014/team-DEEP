class CreateCaptions < ActiveRecord::Migration
  def change
    create_table :captions do |t|
      t.text :body
      t.belongs_to :user
      t.timestamps
    end
  end
end
