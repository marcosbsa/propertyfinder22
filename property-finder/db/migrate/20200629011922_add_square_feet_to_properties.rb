# frozen_string_literal: true

class AddSquareFeetToProperties < ActiveRecord::Migration[6.0]
  def change
    add_column :properties, :square_feet, :integer, default: 0
  end
end
