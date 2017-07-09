class RecipesController < ApplicationController
  before_action :find_recipe, only: [:edit, :show, :update]


  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
  end

  def create
    @recipe = Recipe.create(recipe_params(:name))
    @recipe.add_ingredients(recipe_params(ingredient_ids:[])[:ingredient_ids])
    @recipe.save

    redirect_to recipe_path(@recipe)

  end

  def show
    @recipe_ingredients = @recipe.recipe_ingredients
  end

  def edit
  end

  def update
    @recipe.update(recipe_params(:name))
    @recipe.update_ingredients(recipe_params(ingredient_ids:[])[:ingredient_ids])
    redirect_to recipe_path(@recipe)
  end

  private

    def recipe_params(*args)
      params.require(:recipe).permit(*args)
    end

    def find_recipe
      @recipe = Recipe.find(params[:id])
    end
end
