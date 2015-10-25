class Api::ApiController < ApplicationController
  before_action :validate_token

  private
  def validate_token
    if params[:api_key].nil? or ApiKey.find_by(token: params[:api_key]).nil?
      render json: { error: "Unauthorized" }, status: 403
    end
  end
end
