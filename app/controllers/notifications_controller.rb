class NotificationsController < ApplicationController
	def index
		@notification = Notification.order('created_at DESC')
	end
end
