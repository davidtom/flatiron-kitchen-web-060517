class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
  end

  def create
    binding.pry
    @recipe = Recipe.create(recipe_params(:name))
    redirect_to recipe_path(@recipe)

  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_ingredients = @recipe.recipe_ingredients
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params(:name))

    redirect_to recipe_path(@recipe)
  end

  private

    def recipe_params(*args)
      params.require(:recipe).permit(*args)
    end



end
