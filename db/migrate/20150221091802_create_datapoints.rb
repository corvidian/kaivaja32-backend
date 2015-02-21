class CreateDatapoints < ActiveRecord::Migration
  def change
    create_table :datapoints do |t|
      t.string :domain
      t.decimal :responsetime
      t.string :server
      t.string :framework

      t.timestamps null: false
    end
  end
end
