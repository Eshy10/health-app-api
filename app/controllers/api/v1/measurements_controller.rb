class Api::V1::MeasurementsController < ApplicationController
    before_action :set_measurement, only: [:show]

    def index
      @measurements = Measurement.all
      json_response( @measurements)
    end
  
    def create
     @measurement = Measurement.create!(measurement_params)
      json_response( @measurement, :created)
    end
  
    def show
      json_response( @measurement)
    end
  
    private
  
    def measurement_params
      params.permit(:value, :date, :measure_category_id)
    end
  
    def set_measurement
      @measurement = Measurement.find(params[:id])
    end
end