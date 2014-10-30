class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :text
      t.belongs_to :user
      t.integer :points, default: 0
      t.references :commentable, polymorphic: true

      t.timestamps
    end
  end
end
