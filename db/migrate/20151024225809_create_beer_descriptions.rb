class CreateBeerDescriptions < ActiveRecord::Migration
  def change
    create_table :beer_descriptions do |t|
      t.string :language
      t.string :text
      t.references :beer, index: true

      t.timestamps null: false
    end
    add_foreign_key :beer_descriptions, :beers
  end
end
