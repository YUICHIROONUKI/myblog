class UsersController < ApplicationController

	def index
	   @articles = Article.order('created_at DESC').page(params[:page]).per(8)
	end

	def show
		@article = Article.find(params[:id])
	end
end
