class AddAttachmentAssetToClosedValues < ActiveRecord::Migration
  def self.up
    change_table :closed_values do |t|
      t.attachment :asset
    end
  end

  def self.down
    remove_attachment :closed_values, :asset
  end
end
