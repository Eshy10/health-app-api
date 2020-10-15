class AddUserToMeasurements < ActiveRecord::Migration[5.2]
  def change
    add_reference :measurements, :user, foreign_key: true
  end
end
