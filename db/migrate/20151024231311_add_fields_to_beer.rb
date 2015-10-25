class AddFieldsToBeer < ActiveRecord::Migration
  def change
    add_column :beers, :article_id, :integer
    add_column :beers, :provider, :string
    add_column :beers, :country, :string
    add_column :beers, :alcohol, :string
    add_column :beers, :ecological, :boolean
    add_column :beers, :koscher, :boolean
  end
end
