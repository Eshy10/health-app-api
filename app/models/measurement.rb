class Measurement < ApplicationRecord
  belongs_to :measure_category
  belongs_to :user
  validates_presence_of :value, :date
end
