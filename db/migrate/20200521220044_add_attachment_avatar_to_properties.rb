# frozen_string_literal: true

class AddAttachmentAvatarToProperties < ActiveRecord::Migration[4.2]
  def self.up
    change_table :properties do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :properties, :photo
  end
end
