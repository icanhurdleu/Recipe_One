class RecipesController < ApplicationController

	before_action :find_recipe, only: [:show, :edit, :update, :destroy]

	def index
		@recipe = Recipe.all.order("title ASC")
	end

	def show
	end

	def new
		@recipe = Recipe.new
	end

	def create
		@recipe = Recipe.new(recipe_params)

		# not working for some reason
		if NewGoogleRecaptcha.human?(params[:new_google_recaptcha_token], "checkout") && @recipe.save
			redirect_to root_path, notice: "Successfully created new recipe"
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @recipe.update(recipe_params)
			redirect_to @recipe 
		else
			render 'edit'
		end
	end

	def destroy
		@recipe.destroy
		redirect_to root_path, notice: "Successfully deleted recipe"
	end

	private

	def recipe_params
		params.require(:recipe).permit(	:title, 
																		:description,
																		:serves,
																		:prep,
																		:wait,
																		:tag_list,
																		ingredients_attributes: [:id, :name, :_destroy],
																		directions_attributes: [:id, :step, :_destroy] )
	end

	def find_recipe
		@recipe = Recipe.friendly.find(params[:id])
	end

end