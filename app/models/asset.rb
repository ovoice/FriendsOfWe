class Asset < ActiveRecord::Base
  attr_accessible :type, :name, :url, :attachment_file_name, :attachment_content_type, :attachment_file_size, :attachment_updated_at, :state, :assetable
end
