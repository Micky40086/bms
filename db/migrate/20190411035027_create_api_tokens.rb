class CreateApiTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :api_tokens do |t|
      t.integer :admin_id
      t.string :key
    end
  end
end
