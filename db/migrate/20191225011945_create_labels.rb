class CreateLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :labels do |t|
      t.string :tracking_number
      t.numeric :total_weight
      t.numeric :total_weight_carrier
      t.numeric :overweight
      t.timestamps
    end
  end
end
