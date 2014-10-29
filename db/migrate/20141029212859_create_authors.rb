class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :first_name
      t.string :last_name
      t.string :institution
      t.string :degree
      t.integer :points

      t.belongs_to :user

      t.timestamps
    end
  end
end
