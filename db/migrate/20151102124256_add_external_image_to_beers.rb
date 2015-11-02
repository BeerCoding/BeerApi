class AddExternalImageToBeers < ActiveRecord::Migration
  def change
    add_column :beers, :external_image, :string
  end
end
