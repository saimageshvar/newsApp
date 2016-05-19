class Feed < ActiveRecord::Base
	validates :url, uniqueness: true
	belongs_to :member
end
