class News < ActiveRecord::Base
  has_friendly_id :title, :use_slug => true
  belongs_to :player
  has_many :comments
end