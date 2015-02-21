class CreateCharts < ActiveRecord::Migration
  def change
    create_table :charts do |t|
      t.integer :min
      t.integer :max
      t.integer :count

      t.timestamps null: false
    end
  end
end
