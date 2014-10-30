class CreateUserPosters < ActiveRecord::Migration
  def change
    create_table :user_posters do |t|
      t.belongs_to :user
      t.belongs_to :poster

      t.timestamps
    end
  end
end
