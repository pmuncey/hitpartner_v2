class AddDescriptionToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :description, :string

    add_column :users, :college_tennis, :boolean

  end
end
