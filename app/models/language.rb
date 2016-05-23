class Language < ActiveRecord::Base
	has_many :feeds , :dependent => :destroy
end
