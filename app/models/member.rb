class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  before_save do |user|
    user.email = email.downcase
  end

  has_many :feeds , :dependent => :destroy
  ratyrate_rater
end
