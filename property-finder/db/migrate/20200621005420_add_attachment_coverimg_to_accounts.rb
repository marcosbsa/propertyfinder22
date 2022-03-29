# frozen_string_literal: true

class AddAttachmentCoverimgToAccounts < ActiveRecord::Migration[4.2]
  def self.up
    change_table :accounts do |t|
      t.attachment :coverimg
    end
  end

  def self.down
    remove_attachment :accounts, :coverimg
  end
end
