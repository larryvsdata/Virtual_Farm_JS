class AnimalsController < ApplicationController
  before_action :only_admin , only: [:create ,:edit , :update , :new]
  before_action :set_animal , only: [:show]

  def new
    @animal = Animal.new
  #  binding.pry
  end


  def create
    #binding.pry
    if params[:animal][:farm_id]
      @farm = Farm.find_by(id: params[:animal][:farm_id])
      @farm.animals.build(animal_params)

        if   @farm && @farm.save
          flash[:alert] = "Successfully created #{@farm.animals.last.name} in #{@farm.name} "
          redirect_to farm_animal_path(@farm ,  @farm.animals.last)
        else
          flash[:alert] = "Failed to create the animal in #{@farm.name} "
          redirect_to new_farm_animal_path(@farm)
        end

      else
        flash[:alert] = "Animals can be created through farms "
        redirect_to farms_path
      end

    end

    def show
      #binding.pry
      if params[:farm_id] && !Farm.find_by(id: params[:farm_id]).nil?

        @farm = Farm.find_by(id: params[:farm_id])
        if @farm && !@farm.animals.include?(@animal)
          flash[:alert ]="This farm does not have this animal."
          redirect_to farm_path(@farm)
        end

      #  redirect_to farm_animal_path(@farm , @animal)
      #  binding.pry
    else
      flash[:alert] = "Animal-farm combo is incorrect."
      redirect_to root_path
      end
    end


    def index
    #  binding.pry
      if params[:farm_id]
      #  binding.pry
        @farm = Farm.find_by(id: params[:farm_id])
        redirect_to farm_path(@farm )

    else
      flash[:alert] = "Animals can be reached through farms "
      redirect_to root_path
      end
    end


    def destroy
      #binding.pry
      @farm = Farm.find(params[:farm_id])
      @animal = Animal.find(params[:id])
      flash[:alert] = "Animal #{@animal.name} of quantity #{@animal.quantity} was deleted off this farm."
      @animal.destroy
      redirect_to farm_path(@farm)
    end





  private

  def only_admin
    if !is_signed_in? || !current_owner.admin
      flash[:alert] = "You must be signed in as an administrator to browse this page."
      redirect_to root_path
    end
  end

  def set_animal
    @animal = Animal.find_by(id: params[:id])
    if !@animal
      flash[:alert] = "This animal does not exist."
      redirect_to root_path
    end
  end

  def animal_params
    params.require(:animal).permit(:name , :unit_price  , :quantity )
  end

end
