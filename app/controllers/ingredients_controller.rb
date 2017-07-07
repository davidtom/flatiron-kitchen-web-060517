class IngredientsController < ApplicationController
  before_action :find_ingredient, only: [:edit, :show, :update]

  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.create(ingredient_params(:name, :storage))

    redirect_to ingredient_path(@ingredient)

  end

  def show
    # @ingredient = Ingredient.find(params[:id])
  end

  def edit
    # @ingredient = Ingredient.find(params[:id])
  end

  def update

    @ingredient.update(ingredient_params(:name, :storage))

    redirect_to ingredient_path(@ingredient)
  end

  private

    def ingredient_params(*args)
      params.require(:ingredient).permit(*args)
    end

    def find_ingredient
      @ingredient = Ingredient.find(params[:id])
    end


end
