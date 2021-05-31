class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|
      t.string :title
      t.datetime :start_date
      t.datetime :finish_date
      t.string :all_day

      t.timestamps
    end
  end
end
