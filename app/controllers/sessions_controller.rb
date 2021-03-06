class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def sign_in
    @owner = Owner.new
  end

  def log_in

    @owner= Owner.find_by(name: params[:owner][:name])
    if @owner && @owner.authenticate(params[:owner][:password])

      session[:owner_id] = @owner.id
      redirect_to owner_path(@owner)
    else
      flash[:alert] = "Wrong Combination"
      redirect_to signin_path
    end
  end

  def github_login
    #binding.pry

    @owner = Owner.find_by(name: request.env["omniauth.auth"][:info][:name])

    if @owner

      session[:owner_id] = @owner.id
      redirect_to owner_path(@owner)
    else
      flash[:alert] = "Could not log in via Github."
      redirect_to signin_path
    end

  end

  def session_admin

    render json:  {admin_status: is_signed_in? && current_owner.admin}
  end

  def sign_out
    session.clear
    redirect_to signin_path
  end
end
