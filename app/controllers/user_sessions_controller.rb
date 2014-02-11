class UserSessionsController < ApplicationController
  layout "login"
  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      if User.find(current_user.id).has_role? :admin
        redirect_to admin_root_path
      else
        redirect_to root_path
      end
    else
      render :action => 'new'
    end
  end

  def destroy
    @user_session = UserSession.find(params[:id])
    @user_session.destroy
    redirect_to root_url, :notice => "Logout efetuado com sucesso"
  end
end
