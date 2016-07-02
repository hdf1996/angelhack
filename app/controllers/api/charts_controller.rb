class Api::ChartsController < ApplicationController
	before_action :select_user, only: [:index]
	def index
		from = params[:from] || Date.today - 7.days
		to = params[:to] ||  Date.today
		events = Event.created_between(from,to) #.by_user_id(@user_id)
		events = events.where(name: params[:name]) if !params[:name].nil?
		events_chart = [ ]
		events_names = events.distinct.pluck(:name)
		events_names.each do |event_name|
			data_by_days = []
			current_events = events.where(name: event_name)
			(to-from).to_i.times do |day|
				data_by_days.push current_events.where(date:from + day.days).try(:first).try(:value) || 0
			end
			event_chart = {
			   label: event_name,
			   sum: current_events.sum(:value),
		       data: data_by_days
			}
			events_chart.push event_chart
		end


		render json: {
			metadata:{
				from: from,
				to: to,
				count: events_chart.length
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
