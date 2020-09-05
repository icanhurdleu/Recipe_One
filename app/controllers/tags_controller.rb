class TagsController < ApplicationController
	before_action :find_tag, only: [:show, :edit, :update, :destroy]
	before_action :verify_empty, only: :destroy

	def index
		@tag = Tag.all.order("name ASC")
	end

	def show
	end

	def destroy
		@tag.destroy
		redirect_to tags_path, notice: "Successfully deleted tag"
	end

	private

	def tag_params
		params.require(:tag).permit(:name)
	end

	def find_tag
		@tag = Tag.friendly.find(params[:id])
	end

	def verify_empty
		unless @tag.recipes.count == 0
			redirect_to tags_path, alert: "Cannot delete tag. #{@tag.name.capitalize} is still being referenced in at least one recipe."
		end
	end

end
