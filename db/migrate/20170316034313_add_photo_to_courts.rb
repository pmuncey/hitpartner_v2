class AddPhotoToCourts < ActiveRecord::Migration[5.0]
  def change
    add_column :courts, :photo, :string
  end
end
