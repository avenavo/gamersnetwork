class AddAttachmentBannerToGames < ActiveRecord::Migration
  def self.up
    change_table :games do |t|
      t.attachment :banner
    end
  end

  def self.down
    remove_attachment :games, :banner
  end
end
