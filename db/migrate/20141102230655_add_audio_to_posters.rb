class AddAudioToPosters < ActiveRecord::Migration
  def change
    add_column :posters, :audio_path, :string
  end
end
