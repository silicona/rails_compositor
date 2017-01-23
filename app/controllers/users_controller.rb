class UsersController < ApplicationController
  
  # Antes de acceder a los metodos, hace este filtro. 
  # Si no hay usuarios registrados, nos redirige al pagina para logearnos.
  # En el ejemplo, no se puede acceder a /users sin pasar antes
  # por users/sign_in
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to root_path, :alert => "Acceso denegado."
    end
    if @user.perfil
     @perfil = @user.perfil
   end
   
  end

end
