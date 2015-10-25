class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.string :token, index: true
      t.references :user, index: true
      t.timestamps null: false
    end
    add_foreign_key :api_keys, :users
  end
end
