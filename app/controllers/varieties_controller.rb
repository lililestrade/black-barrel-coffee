class VarietiesController < ApplicationController
  def index
    @varieties = policy_scope(Variety)
    #@varieties = Variety.all

  end

  def show
    @variety = Variety.find(params[:id])
    #@variety = policy_scope(Variety.find(params[:id]))
    authorize @variety
    @productive_country = ProductiveCountry.new()
    authorize @productive_country

    # @variety = Variety.find(params[:variety_id])
    # @productive_country = ProductiveCountry.new
  end

  def new
    @variety = Variety.new()
    authorize @variety
  end

  def create
    @variety = Variety.new(variety_params)
    authorize @variety
    if @variety.save!
      flash[:notice] = 'Successfully created variety.'
      redirect_to varieties_path
    else
      render :new
    end
  end

  private

  def variety_params
    params.require(:variety).permit(:name, :arabica, :robusta, :liberica, :discover_year, :origin, :altitude, :mutation_id, :plant, :strenght, :cup, :description,
                                      productive_countries_attributes: [:id, :country_id, :_destroy],
                                      parents_attributes: [:id, :parent_variety_id, :_destroy])
  end
end
