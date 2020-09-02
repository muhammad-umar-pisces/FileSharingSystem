class Comment < ApplicationRecord
	belongs_to :user, dependent: :destroy
	belongs_to :filesystem, dependent: :destroy
	validates :content, presence: true
end
