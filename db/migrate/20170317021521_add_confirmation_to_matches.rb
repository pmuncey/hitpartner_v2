class AddConfirmationToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :confirmation, :boolean
  end
end
