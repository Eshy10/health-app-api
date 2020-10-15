class CreateMeasurements < ActiveRecord::Migration[5.2]
  def change
    create_table :measurements do |t|
      t.decimal :value
      t.datetime :date
      t.references :measure_category, foreign_key: true

      t.timestamps
    end
  end
end
