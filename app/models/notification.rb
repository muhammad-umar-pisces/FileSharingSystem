class Notification < ApplicationRecord
	belongs_to :filesystem, dependent: :destroy
	belongs_to :user
end
