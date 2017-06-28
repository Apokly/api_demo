# frozen_string_literal: true

class AddLapsToRace < ActiveRecord::Migration[5.1]
  def change
    add_column :races, :laps, :integer
  end
end
