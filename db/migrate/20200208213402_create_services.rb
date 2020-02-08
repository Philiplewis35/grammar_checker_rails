class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string :base_url
      t.timestamps
    end

    create_table :user_services do |t|
      t.integer :user_id
      t.integer :service_id
      t.timestamps
    end
  end
end
