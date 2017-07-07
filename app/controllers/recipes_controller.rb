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
    # binding.pry
    @recipe = Recipe.create(recipe_params(:name))
    @recipe.add_ingredients(ingredient_params(:ingredient_name))
    # binding.pry
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

    redirect_to recipe_path(@recipe)
  end

  private

    def recipe_params(*args)
      params.require(:recipe).permit(*args)
    end

    def ingredient_params(*args)
      params.require(:recipe_ingredient).permit!
    end

    def find_recipe
      @recipe = Recipe.find(params[:id])
    end

end
