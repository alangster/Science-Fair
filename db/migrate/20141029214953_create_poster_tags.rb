class CreatePosterTags < ActiveRecord::Migration
  def change
    create_table :poster_tags do |t|
      t.belongs_to :poster
      t.belongs_to :tag

      t.timestamps
    end
  end
end
