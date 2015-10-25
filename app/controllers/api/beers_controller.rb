class Api::BeersController < Api::ApiController
  def index
    @beers = Beer.all
    render json: @beers
  end
end
