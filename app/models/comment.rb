class Comment < ActiveRecord::Base
  validates_presence_of :body
  belongs_to :news
  belongs_to :player
end
