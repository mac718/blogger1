class TagsController < ApplicationController
	before_filter :require_login, only: [:destroy]

	def require_login
    	unless current_user
    	  redirect_to root_path
     	 return false
    	end
  	end

	def index
		@tags = Tag.all
	end

	def show
		@tag = Tag.find(params[:id])

	end

	def destroy
		@tag = Tag.find(params[:id])
		@tag.destroy

		flash.notice = "Tag '#{@tag.name}' deleted!"

		redirect_to article_path
	end
end
