class CreateDemoModels < ActiveRecord::Migration[5.2]
  def change
    create_table :demo_models do |t|
      t.string "name"
      t.string "email"
      t.timestamps
    end
  end
end
