class CreateTimeLogs < ActiveRecord::Migration
  def change
    create_table :time_logs do |t|
      t.integer :project_id
      t.integer :developer_id
      t.date :date
      t.integer :minutes

      t.timestamps null: false
    end
  end
end
