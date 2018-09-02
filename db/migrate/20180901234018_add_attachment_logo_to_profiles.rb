class AddAttachmentLogoToProfiles < ActiveRecord::Migration[5.1]
  def self.up
    change_table :profiles do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :profiles, :logo
  end
end
