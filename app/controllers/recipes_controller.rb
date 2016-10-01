class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all.order('created_at DESC')
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new

    if @recipe.save
      flash[:notice] = 'Recipe has been created.'
      redirect_to @recipe
    else
      flash[:alert] = 'Recipe has not been created.'
      render 'new'
    end
  end

  def show
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :description)
  end

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end
end
