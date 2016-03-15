class AddAttachmentAssetToGames < ActiveRecord::Migration
  def self.up
    change_table :games do |t|
      t.attachment :asset
    end
  end

  def self.down
    remove_attachment :games, :asset
  end
end
