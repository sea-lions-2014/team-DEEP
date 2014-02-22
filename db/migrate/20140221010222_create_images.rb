class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.belongs_to :user
      t.text :url
      t.string :title
    end
  end
end
