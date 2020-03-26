class ParentsController < ApplicationController
  def create
    @parent = Parent.new(parent_params)
    authorize @parent
    # we need `variety_id` to associate productive_country with corresponding variety
    # @variety = Variety.find(params[:id])
    # @productive_country.variety_id = @variety
    # @productive_country.save
    if @parent.save!
      flash[:notice] = 'Successfully created productive_country.'
      redirect_to variety_path(@parent.variety_id)
    else
      render :new
    end
  end

  def destroy
    @parent = Parent.find(params[:id])
    authorize @parent

    @parent.destroy

    # no need for app/views/parents/destroy.html.erb
    redirect_to variety_path(@parent.variety_id)
  end

  private

  def parent_params
    params.require(:parent).permit(:variety_id, :parent_variety_id)
  end
end
