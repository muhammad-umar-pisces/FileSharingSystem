class Filesystem < ApplicationRecord
	after_create :create_notification
	after_update :update_notification
	before_destroy :destroy_notification
	belongs_to :user
	has_many :comments
	has_many :notifications
	validates :file_name, presence: true
	has_one_attached :image
	enum status: { public_status:0, private_status: 1 } 

	def create_notification
		notifications.create(title: "#{file_name} uploaded!", user_id: self.user.id)
	end

	def create_notification
		notifications.create(title: "#{file_name} updated!", user_id: self.user.id)
	end

	def create_notification
		notifications.create(title: "#{file_name} deleted!", user_id: self.user.id)
	end
end
