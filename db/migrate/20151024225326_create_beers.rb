class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.string :category
      t.integer :bitter
      t.integer :body
      t.integer :sweet
      t.datetime :edited_at, default: nil

      t.timestamps null: false
    end
  end
end
