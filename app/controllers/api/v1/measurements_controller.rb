class Api::V1::MeasurementsController < ApplicationController
  before_action :set_measurement, only: [:show]

  def index
    @measurements = current_user.measurements.order('date DESC')
    json_response(@measurements)
  end

  def create
    @measurement = current_user.measurements.create!(measurement_params)
    json_response(@measurement, :created)
  end

  def show
    json_response(@measurement)
  end

  private

  def measurement_params
    params.permit(:value, :date, :measure_category_id)
  end

  def set_measurement
    @measurement = Measurement.find(params[:id])
  end
end
