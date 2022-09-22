class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.text :status
      t.integer :guest_id
      t.time :start_time
      t.time :end_time
      t.date :day

      t.timestamps
    end
  end
end
