class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :name, presence: true

  def add_ingredients(ingredients_array)
    ingredients_array.each do |ingredient_id|
      self.ingredients << Ingredient.find(ingredient_id.to_i) if ingredient_id.to_i != 0
    end
  end

  def update_ingredients(ingredients_array)
    self.ingredients.clear
    add_ingredients(ingredients_array)
  end

end
