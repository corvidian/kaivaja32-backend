class CreateDomains < ActiveRecord::Migration
  def change
    create_table :domains do |t|
      t.string :name
      t.decimal :median
      t.decimal :min
      t.decimal :max
      t.decimal :avg
      t.string :server
      t.string :framework

      t.timestamps null: false
    end
  end
end
