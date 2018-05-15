class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.string :name
      t.references :event, index: true

      t.timestamps
    end
  end
end
