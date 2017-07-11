class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.string :title
      t.references :user
      t.datetime :appt_time

      t.timestamps
    end
    add_index :appointments, [:user_id, :appt_time]
  end
end
