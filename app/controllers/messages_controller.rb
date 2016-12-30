class MessagesController < ApplicationController
	before_action :authenticate_user!
	def index
		@messages= Message.all.order("created_at DESC")

	end
	def show
	end

	def new
		@message = current_user.messages.build
	end
	def create
		@message=current_user.pics.build(pic_params)
		
		redirect_to messages_path
	end
	private
	def message_params
     params.require(:message).permit(:content)
	end

end
