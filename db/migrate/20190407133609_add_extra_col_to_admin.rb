class AddExtraColToAdmin < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :name, :string
    add_column :admins, :provider, :string
  end
end
