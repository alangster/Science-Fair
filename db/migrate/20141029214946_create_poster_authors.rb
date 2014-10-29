class CreatePosterAuthors < ActiveRecord::Migration
  def change
    create_table :poster_authors do |t|
      t.belongs_to :author
      t.belongs_to :poster

      t.timestamps
    end
  end
end
