class CreatePosters < ActiveRecord::Migration
  def change
    create_table :posters do |t|
      t.text :title
      t.text :abstract
      t.string :filepath
      t.integer :points, deafault: 0
      t.belongs_to :user

      t.timestamps
    end
  end
end
