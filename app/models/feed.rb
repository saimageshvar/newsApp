class Feed < ActiveRecord::Base
	validates :url, uniqueness: true
	belongs_to :user
end
