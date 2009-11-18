class Project < ActiveRecord::Base
  has_many :assets, :as => :assetable
  has_many :links, :as => :assetable
  has_many :documents, :as => :assetable
  has_many :photos, :as => :assetable
  has_many :commitments
  has_many :volunteers, :through => :commitments, :source => :user  #, :condition => 'state = "confirmed"'
  has_many :opportunities 
  
  acts_as_taggable_on :tags
  
  default_scope :order => 'created_at desc'
  named_scope :features, :conditions => {:featured => true}
  named_scope :published, :conditions => {:state => 'publish'}
  
  attr_accessible :name, :description, :activities, :state, :volunteer_count, :featured
end
