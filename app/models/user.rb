class User < ApplicationRecord
	has_many :posts
	has_many :comments

	before_save do
		self.name.downcase!
		self.email = email.downcase
	end



	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

	validates :name, presence: true, length: {in: 6..20}, uniqueness: {case_sensitive: false}

	validates :email, presence: true, length: {in: 6..30}, uniqueness: {case_sensitive: false},
	                  format: {with: VALID_EMAIL_REGEX}

	

end
