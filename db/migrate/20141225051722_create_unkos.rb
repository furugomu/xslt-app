class CreateUnkos < ActiveRecord::Migration
  def change
    create_table :unkos do |t|
      t.string :name
      t.string :greeting

      t.timestamps null: false
    end
  end
end
