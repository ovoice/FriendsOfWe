class Asset < ActiveRecord::Base
  belongs_to :assetable
  attr_accessible :name, :url, :attachment_file_name, :attachment_content_type, :attachment_file_size, :attachment_updated_at, :state
end
