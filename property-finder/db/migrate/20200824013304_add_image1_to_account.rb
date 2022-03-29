# frozen_string_literal: true

class AddImage1ToAccount < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :company, :string
    add_column :accounts, :image1, :string
  end
end
