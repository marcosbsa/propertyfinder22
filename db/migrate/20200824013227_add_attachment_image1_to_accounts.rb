# frozen_string_literal: true

class AddAttachmentImage1ToAccounts < ActiveRecord::Migration[4.2]
  def self.up
    change_table :accounts do |t|
      t.attachment :image1
    end
  end

  def self.down
    remove_attachment :accounts, :image1
  end
end
