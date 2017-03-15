class AddNameToCourts < ActiveRecord::Migration[5.0]
  def change
    add_column :courts, :name, :string

    add_column :courts, :description, :string
  end
end
