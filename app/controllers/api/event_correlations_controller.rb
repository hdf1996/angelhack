class Api::EventCorrelationsController < ApplicationController
  def show
    render json: CorrelationCalculator.new(params.fetch(:event_name)).calculate
  end
end
