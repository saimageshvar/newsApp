class Feed < ActiveRecord::Base
	validates :url, uniqueness: true
	validates :name, uniqueness: true
	belongs_to :user
end
