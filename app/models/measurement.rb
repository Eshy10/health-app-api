class Measurement < ApplicationRecord
  belongs_to :measure_category
  validates_presence_of :value, :date
end
