# spec/requests/todos_spec.rb
require 'rails_helper'

RSpec.describe 'MeasureCategory API', type: :request do
  # initialize test data
  let!(:measure_categories) { create_list(:MeasureCategory, 2 }
  let(:measure_category_id) { measure_categories.first.id }

  # Test suite for GET /measure_categories
  describe 'GET /measure_categories' do
    # make HTTP get request before each example
    before { get '/measure_categories' }

    it 'returns measure_categories' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(2)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /measure_categories/:id
  describe 'GET /measure_categories/:id' do
    before { get "/measure_categories/#{measure_category_id}" }

    context 'when the record exists' do
      it 'returns the category' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(measure_category_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:measure_category_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Todo/)
      end
    end
  end

  # Test suite for POST /measure_categories
  describe 'POST /measure_categories' do
    # valid payload
    let(:valid_attributes) { { name: 'Weight' } }

    context 'when the request is valid' do
      before { post '/measure_categories', params: valid_attributes }

      it 'creates a category' do
        expect(json['name']).to eq('Weight')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/measure_categories', params: { name: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Created by can't be blank/)
      end
    end
  end
end
