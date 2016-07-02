class Api::EventsController < ApplicationController
	def index
		render json: {
			test: "test"
		}
	end
end
