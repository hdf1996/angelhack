class Api::EventsController < ApplicationController
	def index
		if !params[:event_type].nil?
			render json: Event.where(event_type:params[:event_type])
		else
			render json: Event.all
		end
	end
	def chart
		if !params[:event_type].nil?
			render json: Event.where(event_type:params[:event_type])
		else
			render json: Event.all
		end
	end
end
