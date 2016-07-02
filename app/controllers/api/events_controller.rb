class Api::EventsController < ApplicationController
	def index
		render json: Event.all
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
		  :event_type,
			:name,
			:date,
			:metadata
		)
	end
end
