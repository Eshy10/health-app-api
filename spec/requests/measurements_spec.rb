require 'rails_helper'

RSpec.describe 'Measurements API' do
  let(:user) { create(:user) }
  let!(:measure_category) { create(:MeasureCategory) }
  let!(:measurements) { create_list(:Measurement, 20, measure_category_id: measure_category.id, user_id: user.id) }
  let(:measure_category_id) { measure_category.id }
  let(:id) { measurements.first.id }
  let(:headers) { valid_headers }

  describe 'GET Measurements' do
    before { get "/api/v1/measurements", headers: headers }

    context 'when category exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all todo items' do
        expect(json.size).to eq(20)
      end
    end
  end


  describe 'GET /api/v1/measurements/:id' do
    before { get "/api/v1/measurements/#{id}", headers: headers }

    context 'when measurements exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the measurement' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when measurement does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Measurement/)
      end
    end
  end


  describe 'POST Measurements' do
    let(:valid_attributes) { { value: 41.5, date: '6-10-2020', measure_category_id: 1 } }

    context 'when an invalid request' do
      before { post "/api/v1/measurements", params: {}, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Measure category must exist, Value can't be blank, Date can't be blank/)
      end
    end
  end

end