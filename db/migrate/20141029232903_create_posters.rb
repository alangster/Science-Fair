class CreatePosters < ActiveRecord::Migration
  def change
    create_table :posters do |t|
      t.text :title
      t.text :abstract
      t.string :filepath
      t.integer :points, default: 0
      t.belongs_to :creator

      t.timestamps
    end
  end
end
