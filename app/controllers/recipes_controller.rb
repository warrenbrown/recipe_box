class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all.order('created_at DESC')
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)

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

  def edit

  end

  def update
    if @recipe.update(recipe_params)
      flash[:notice] = 'Recipe has been updated.'
      redirect_to @recipe
    else
      flash[:alert] = 'Recipe has not been updated.'
      render 'new'
    end
  end

  def destroy
    @recipe.delete
    flash[:notice] = 'Recipe has been deleted.'
    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :description)
  end

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end
end
