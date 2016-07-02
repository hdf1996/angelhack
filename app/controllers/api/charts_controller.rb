class Api::ChartsController < ApplicationController
	def index
		render json: [{
			name: "Horas de Actividad Fisica",
			data: [3,4,5,6,7,8,1]
		},
		{
			name: "Horas de dormir",
			data: [3,4,5,6,7,8,1]
		},
		{
			name: "Sexy time",
			data: [69,69,69,69,69,69,69]
		}
	]
	end
	def show
		render json: {
			name: "test",
			data: [3,4,5,6,7,8,1]
		}
	end
end
