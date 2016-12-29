class CommentsController < ApplicationController
	before_action :find_pic
	before_action :find_comment, only: [:destroy]

	def create
		@comment = @pic.comments.create(params[:comment].permit(:content))
		@comment.user_id = current_user.id
		@comment.save

		if @comment.save
			redirect_to pic_path(@pic)
		else
			render 'new'
		end
	end
	def destroy
		@comment.destroy
		redirect_to pic_path(@pic)

	end

	


	

	private

	def find_pic
     @pic= Pic.find(params[:pic_id])
 	end

 	def find_comment
 		@comment = @pic.comments.find(params[:id])
 	end

end
