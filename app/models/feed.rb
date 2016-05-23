class Feed < ActiveRecord::Base
	validates :url, uniqueness: true
	belongs_to :member
	ratyrate_rateable "Fav"
end
