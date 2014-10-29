class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_hash
      t.string :linkedin_url
      t.integer :points
      t.string :profile_pic

      t.timestamps
    end
  end
end
