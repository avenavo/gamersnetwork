class ClosedValue < ActiveRecord::Base
  has_attached_file :asset
  validates_attachment_content_type :asset, :content_type => /\Aimage\/.*\Z/
  attr_accessor :delete_asset
  before_validation { self.asset.clear if self.delete_asset == '1' }

  validates :game_property_id, :value, :presence => true
  belongs_to :game_property
end
