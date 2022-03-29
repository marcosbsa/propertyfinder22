# frozen_string_literal: true

class AddAvailableDateToProperties < ActiveRecord::Migration[6.0]
  def change
    add_column :properties, :available_date, :datetime
  end
end
