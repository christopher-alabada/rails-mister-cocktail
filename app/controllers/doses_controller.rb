class DosesController < ApplicationController
  before_action :set_cocktail, only: [:new, :create]

  def new
    @ingredient = Ingredient.new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    # @dose.ingredient = Ingredient.find(params[:ingredient][:name])
    @dose.ingredient = Ingredient.find(params[:dose][:ingredient_id].to_i)
    # raise
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render template: 'cocktails/show'
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(Cocktail.find(@dose.cocktail_id))
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description)
  end

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
