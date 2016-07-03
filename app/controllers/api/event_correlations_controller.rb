class Api::EventCorrelationsController < ApplicationController
  def show
    render json: CorrelationCalculator.new(params.fetch(:event_name)).calculate
  end
  def conclusions
  	correlation = CorrelationCalculator.new(params.fetch(:event_name)).calculate
  	render json: {
  		data: [
  			{
  				name: "",
  				show_name: "",
  				type: "danger",
  				text: "",
  				higher_is_better: true

  			},
  			  			{
  				name: "",
  				show_name: "",
  				type: "good",
  				text: "",
  				higher_is_better: true

  			},
  			{
  				name: "",
  				show_name: "",
  				type: "warning",
  				text: "",
  				higher_is_better: true

  			},
  		]
  	}
  end
end
