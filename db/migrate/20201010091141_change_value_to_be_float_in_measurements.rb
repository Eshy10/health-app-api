class ChangeValueToBeFloatInMeasurements < ActiveRecord::Migration[5.2]
  def up
    change_column :measurements, :value, :float
  end

  def down
    change_column :measurements, :value, :decimal
  end
end
