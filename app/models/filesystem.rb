class Filesystem < ApplicationRecord
	belongs_to :user
	has_many :comments
	has_many :notifications
	validates :file_name, presence: true
	enum status: { public_status:0, private_status: 1 } 
end
