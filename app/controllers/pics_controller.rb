class PicsController < ApplicationController
	before_action :find_pic, only: [:show, :edit, :update, :destroy ]

	def index
		@pics= Pic.all.order("created_at DESC")
	end
	

	def show
		

	end
	def new
		@pic = current_user.pics.build
	end
	def create
		@pic=current_user.pics.build(pic_params)
		if @pic.save
			redirect_to root_path
		else
			render 'new'
		end
	end
	def edit

	end

	def destroy
     @pic.destroy
     redirect_to root_path
	end

	def update
		if @pic.update(pic_params)
			redirect_to root_path
		else
			render 'edit'
		end


	end

	private
	def pic_params
     params.require(:pic).permit(:title, :image)
	end

	def find_pic
     @pic= Pic.find(params[:id])
 	end

	
end
