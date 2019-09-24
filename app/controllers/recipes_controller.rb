

class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])

  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(quantity: 'zero')
    @recipe.ingredients.build(quantity: 'zero')
  end

  def create
    
    Recipe.create(recipe_params)
    
    
    # byebug
    
  end

  private
    def recipe_params
      params.require(:recipe).permit(
        :title,
        ingredients_attributes: [
          :name,
          :quantity
        ]
      )
    end

    def ingredient_params(*args)
      params.require(:recipe).require(:ingredients_attributes).permit(*args)
    end
end
