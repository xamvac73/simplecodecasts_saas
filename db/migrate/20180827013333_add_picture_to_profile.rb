class AddPictureToProfile < ActiveRecord::Migration[5.1]
  def self.up
    change_table :profiles do |t|
      t.attachment :picture
    end
  end

  def self.down
    drop_attached_file :profiles, :picture
  end
end
