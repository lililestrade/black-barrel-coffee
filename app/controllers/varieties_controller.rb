class VarietiesController < ApplicationController
  def index
    @varieties = policy_scope(Variety)
    #@varieties = Variety.all
    #@kids = Variety.where()
    # Parent.where(parent_variety_id: parent).each do |child|
    #   children << Variety.find(child.variety_id)
    # end

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

  def destroy
    @variety = Variety.find(params[:id])
    authorize @variety
    parents_to_delete = Parent.where(parent_variety_id: params[:id])
    parents_to_delete.each { |parent| parent.destroy }

    @variety.destroy

    # no need for app/views/varietys/destroy.html.erb
    redirect_to varieties_path
  end


  private

  def variety_params
    params.require(:variety).permit(:name, :arabica, :robusta, :liberica, :discover_year, :origin, :altitude, :mutation_id, :plant, :strenght, :cup, :description,
                                      productive_countries_attributes: [:id, :country_id, :address, :_destroy],
                                      parents_attributes: [:id, :parent_variety_id, :_destroy])
  end
end
