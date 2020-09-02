class TagsController < ApplicationController

	def index
		@tag = Tag.all.order("name DESC")
	end

	def show
		@tag = Tag.find(params[:id])
	end

end
