class Api::ChartsController < ApplicationController
	before_action :select_user, only: [:index]
	def index
		from = params[:from] || Date.today - 7.days
		to = params[:to] ||  Date.today
		events = Event.created_between(from,to) #.by_user_id(@user_id)

		events_chart = [ ]
		3.downto(1) do
			event = {
			   label: 'Horas de Sueño', 
		       data: [5, 4, 5, 6, 8, 7, 3]
			}
			events_chart.push event
		end


		render json: {
			metadata:{
				from: from,
				to: to,
				count: 3
			},
			data: events_chart
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
