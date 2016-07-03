class Api::ChartsController < ApplicationController
	before_action :select_user, only: [:index]
	def index
		data = Event.distinct.pluck(:name).map do |event_name|
      from = params.fetch(:from, Time.now - 7.days).to_date
      to = params.fetch(:from, Time.now).to_date

      events = Event.where(name: event_name, date: from..to).map do |e|
        [e.date, e.value]
      end.to_h

      {
        event_name: event_name,
        events: events
      }
    end

		render json: {
      data: data
    }
	end
	def show
		render json: {
			name: "test",
			data: [3,4,5,6,7,8,1]
		}
	end
	private
		def select_user
			@user_id = 3
		end
		def permitted_params
			params.permit[

			]
		end
end
