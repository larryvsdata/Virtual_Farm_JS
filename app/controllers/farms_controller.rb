class FarmsController < ApplicationController
before_action :set_farm , only: [:show ,:edit , :update]
before_action :only_admin , only: [:new ,:create, :edit , :update]
skip_before_action :verify_authenticity_token


  def new
    @farm =Farm.new
  end

  def create
    #binding.pry
    @farm = Farm.new(farm_params)

    if @farm.valid?
      @farm.save
      flash[:alert] = "Farm #{@farm.name} created, successfully."
      redirect_to farm_path(@farm)
    else
      flash[:alert] = "Failed to create farm."
      render :new
    end

  end

  def edit

  end

  def update

    if @farm.update(farm_params)
      flash[:alert] = "Farm #{@farm.name} updated, successfully."
      redirect_to farm_path(@farm)
    else
      flash[:alert] = "Failed to update the farm #{@farm.name}."
      redirect_to edit_farm_path
    end
  end

  def show
    respond_to do |format|
       format.html { render :show }
       format.json { render json: @farm }
     end
  end

  def index
    @available_farms = Farm.get_available_farms
    @owner = current_owner if is_signed_in?
		#binding.pry
		respond_to do |format|
			format.html {render :index}
			format.json {render json: @available_farms }
			format.xml {render xml: @available_farms }
		end
  end

  def buy_farm
    @owner = current_owner
    farm = Farm.find_by_id(params[:farm_id])
    message= @owner.buy_farm(farm)
    flash[:alert]=message
  #  binding.pry
    @owner.save
    redirect_to owner_path(@owner)
  end


  def sell_farm
    #binding.pry
    @owner = current_owner
    farm = Farm.find_by_id(params[:farm_id])
    message= @owner.sell_farm(farm)
    @owner.save
    flash[:alert]=message
  #
    redirect_to root_path
  end

  def destroy
    #binding.pry
    @farm = Farm.find(params[:id])
    title= @farm.name
    if @farm.owners == []
      @farm.destroy
      flash[:alert]="Farm #{title} deleted."
      redirect_to root_path
    else
      owner = @farm.owners.first
      @farm.destroy
      flash[:alert]="Farm #{title} deleted."
      redirect_to owner_path(owner)
    end

  end


  private
  def set_farm
  #  binding.pry
  farm = Farm.find_by(id: params[:id])
    if farm.nil?
      flash[:alert] = "This farm does not exist."
    #  binding.pry
      redirect_to root_path
    end
    @farm = Farm.find_by(id: params[:id])
  end

  def farm_params
    params.require(:farm).permit(:name  )
  end

  def only_admin
    if !is_signed_in? || !current_owner.admin
      flash[:alert] = "You must be signed in as an administrator to browse this page."
      redirect_to root_path
    end
  end

end
