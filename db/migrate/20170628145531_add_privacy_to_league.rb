# frozen_string_literal: true

class AddPrivacyToLeague < ActiveRecord::Migration[5.1]
  def change
    add_column :leagues, :privacy, :integer, default: 0
  end
end
