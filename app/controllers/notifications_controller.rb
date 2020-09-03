class NotificationsController < ApplicationController
	def index
		@notification = Notification.all
	end
end
