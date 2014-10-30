class CreatePosters < ActiveRecord::Migration
  def change
    create_table :posters do |t|
      t.text :title
      t.text :abstract
      t.string :filepath
      t.integer :points, deafault: 0
      t.belongs_to :creator, class_name: "User", foreign_key: :user_id

      t.timestamps
    end
  end
end
