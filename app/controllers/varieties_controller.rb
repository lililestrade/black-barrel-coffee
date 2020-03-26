class VarietiesController < ApplicationController
  def index
    @varieties = policy_scope(Variety)
    #@varieties = Variety.all

  end

  def show
    #@variety = policy_scope(Variety.find(params[:id]))
    @variety = Variety.find(params[:id])
    authorize @variety

    # @variety = Variety.find(params[:variety_id])
    # @productive_country = ProductiveCountry.new
    @productive_country = ProductiveCountry.new()
    authorize @productive_country

    @parent = Parent.new()
    authorize @parent
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

  def edit
    @variety = Variety.find(params[:id])
    authorize @variety

  end

  def update
    @variety = Variety.find(params[:id])
    authorize @variety
    if @variety.update(variety_params)
      redirect_to variety_path(@variety)
    else
      render :edit
    end
  end

  # def destroy
  #   @variety = Variety.find(params[:id])
  #   @variety.destroy
  # end

  private

  def variety_params
    params.require(:variety).permit(:name, :arabica, :robusta, :liberica, :discover_year, :origin, :altitude, :mutation_id, :plant, :strenght, :cup, :description,
                                      productive_countries_attributes: [:id, :country_id, :_destroy],
                                      parents_attributes: [:id, :parent_variety_id, :_destroy])
  end
end
