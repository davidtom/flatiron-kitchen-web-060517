class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :name, presence: true

  def add_ingredients(ingredient_hash)
    # if !ingredient_hash.nil?
    ingredient_hash[:ingredient_name].each do |ingredient_id|
      self.ingredients << Ingredient.find(ingredient_id.to_i) if ingredient_id.to_i != 0
    end
  end

end
