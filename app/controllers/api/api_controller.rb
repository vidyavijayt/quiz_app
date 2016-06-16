class Api::ApiController < ApplicationController
  layout false
  skip_before_action :verify_authenticity_token
  include ApiConcern

  # Custom exception handling
  rescue_from Exception do |exception|
    handle_error(exception)
  end

  # Response for exception
  def handle_error(e)
    error_info = {
      data: {},
      message: e.message,
      status: STATUS[:failure]
    }
    render json: error_info
  end

  # Raises RoutingError which will be rescued from
  # in the same way as other exceptions.
  def routing_error
    fail ActionController::RoutingError.new(params[:path]), 'Routing Error'
  end

end
