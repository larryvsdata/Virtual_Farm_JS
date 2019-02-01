class OwnersController < ApplicationController
  before_action :set_owner , only: [:show ,:edit , :update , :get_coowner]
  before_action :identify , only: [:get_coowner]

  def new
    @owner = Owner.new
  end

  def create
    #binding.pry
    @owner=Owner.new(owner_params)

    if @owner.valid?
      @owner.save
    #  binding.pry
      session[:owner_id] = @owner.id
      flash[:notice] = "Welcome to Virtual Park!"
      redirect_to owner_path(@owner)
    else
      flash[:notice] = "Unable to log in."
      render :new
    end

  end


  def get_coowner

    if is_signed_in?
      @farms = @owner.farms
      @coowners = []
      @coowners .replace(Owner.all)

    #  binding.pry
    else
      flash[:alert] = "You need to be signed in to set co-owners."
      redirect_to root_path
    end
  end

  def set_coowner
    #binding.pry
    farm = Farm.find(params[:farm])
    coowner = Owner.find(params[:coowner])
  #  binding.pry
    if farm && coowner
      if farm.owners.include?(coowner)
        flash[:alert] = "#{farm.name} is (co-)owned by #{coowner.name} already."
        redirect_to farm_path(farm)
      else
        farm.owners << coowner
        flash[:alert] = "#{farm.name} has been added to #{coowner.name} ."
      #  binding.pry
        redirect_to farm_path(farm)
      end

    else
      flash[:alert] = "Failed to find either the farm or the owner."
      redirect_to root_path
    end


  end



  private
  def set_owner
    @owner = Owner.find_by(id: params[:id])
    if !@owner
      flash[:alert] = "This owner does not exist."
      redirect_to root_path
    end
  end

  def identify
    if @owner != current_owner || current_owner.admin
      flash[:alert] = "The owner or the admin has this privilige only. Redirecting to your homepage."
      redirect_to owner_path(current_owner)
    end

  end

  def owner_params
    params.require(:owner).permit(:name , :password  , :money )
  end
end
