class MeasureCategory < ApplicationRecord
    has_many :measurements, dependent: :destroy
    validates_presence_of :name
end
