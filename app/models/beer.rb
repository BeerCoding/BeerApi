class Beer < ActiveRecord::Base
  has_many :beer_descriptions

  def description_by_language(language)
    self.beer_descriptions.where(language: language).first
  end
end
