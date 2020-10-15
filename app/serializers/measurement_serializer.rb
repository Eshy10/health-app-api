class MeasurementSerializer < ActiveModel::Serializer
  attributes :id, :value, :date, :user, :measure_category_id

  belongs_to :measure_category
  belongs_to :user
end
