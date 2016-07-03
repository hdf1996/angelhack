class Api::EventsController < ApplicationController
	def index
		if !params[:name].nil?
			render json: Event.where(name:params[:name])
		else
			render json: Event.all
		end
	end
	def chart
		if !params[:name].nil?
			render json: Event.where(name:params[:name])
		else
			render json: Event.all
		end
	end

	def show
		render json: Event.find(params.fetch(:id))
	end

	def create
		event = Event.new(permitted_attributes)

		if event.save
			render json: event, status: :created
		else
			render json: event.errors, status: :unprocessable_entity
		end
	end

	def update
		render json: Event.find(params.fetch(:id))

		if event.update(permitted_attributes)
			render json: event, status: :ok
		else
			render json: event.errors, status: :unprocessable_entity
		end
  end

  private

	def permitted_attributes
		params.require(:event).permit(
			:name,
			:date,
			:value
		)
	end
end
