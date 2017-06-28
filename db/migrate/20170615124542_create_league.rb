# frozen_string_literal: true

class CreateLeague < ActiveRecord::Migration[5.1]
  def change
    create_table :leagues do |t|
      t.string :name
    end

    add_reference :users, :league, index: true, foreign_key: true
  end
end
