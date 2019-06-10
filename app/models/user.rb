class User < ActiveRecord::Base
	has_secure_password

	has_many :requests
	has_many :jobs, through: :requests
end