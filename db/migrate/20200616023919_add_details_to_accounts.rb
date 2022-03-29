# frozen_string_literal: true

class AddDetailsToAccounts < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :details, :text
  end
end
