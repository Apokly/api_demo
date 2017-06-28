# frozen_string_literal: true

class AddDateToRace < ActiveRecord::Migration[5.1]
  def change
    add_column :races, :date, :datetime
  end
end
