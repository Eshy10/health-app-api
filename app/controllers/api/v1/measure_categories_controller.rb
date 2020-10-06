class Api::V1::MeasureCategoriesController < ApplicationController
    before_action :set_measure_category, only: [:show]

    def index
      @measure_categories = MeasureCategory.all
      json_response( @measure_category)
    end
  
    def create
     @measure_category = MeasureCategory.create!(measure_category_params)
      json_response( @measure_category :created)
    end
  
    def show
      json_response( @measure_category)
    end
  
    private
  
    def measure_category_params
      params.permit(:name)
    end
  
    def set_measure_category
      @measure_category = MeasureCategory.find(params[:id])
    end
end