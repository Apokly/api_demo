class CreateRaces < ActiveRecord::Migration[5.1]
  def change
    create_table :races do |t|
      t.belongs_to :league

      t.string :name
      t.string :country
      t.integer :status # TODO, IN_PROGRESS, DONE
      t.float :distance
    end
  end
end
