class MailboxController < ApplicationController
	before_action :authenticate_user!
	def inbox
		@inbox = mailbox.inbox

	end
end
