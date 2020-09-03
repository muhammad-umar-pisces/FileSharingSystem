class Filesystem < ApplicationRecord
	after_create :create_notification
	after_update :update_notification
	before_destroy :destroy_notification
	belongs_to :user
	has_many :comments
	has_many :notifications
	validates :file_name, presence: true
	has_one_attached :image
	validates :image, presence: true
	enum status: { public_status:0, private_status: 1 } 

	def create_notification
		notifications.create(title: "You uploaded #{file_name} ", user_id: self.user.id)
	end

	def update_notification
		notifications.create(title: "You updated #{file_name}", user_id: self.user.id)
	end

	def destroy_notification
		notifications.create(title: "You deleted #{file_name}", user_id: self.user.id)
	end

	def increase_visit
    	self.visit_counter += 1
    	save!
    	notifications.create(title: "viewed #{file_name}", user_id: self.user.id)
    end
end
