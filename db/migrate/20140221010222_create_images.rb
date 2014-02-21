class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.text :url
      t.string :title
      t.belongs_to :user
    end
  end
end
