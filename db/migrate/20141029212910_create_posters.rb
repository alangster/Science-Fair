class CreatePosters < ActiveRecord::Migration
  def change
    create_table :posters do |t|
      t.text :title
      t.text :abstract
      t.string :filepath
      t.belongs_to :user
      t.integer :points

      t.timestamps
    end
  end
end
