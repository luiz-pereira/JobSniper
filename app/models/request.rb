class Request < ActiveRecord::Base
	belongs_to :user
	has_many :jobs
	has_many :parameters
end