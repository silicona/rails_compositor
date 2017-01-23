class PerfilController < ApplicationController

	before_action :authenticate_user!
	
  def index
  end

  def show

  	# Con current_user se captura la sesion del actual usuario
  	@usuario = User.find(current_user.id)
  	
    # O hay un perfil existente o se crea uno
  	# @usuario.perfil es la relacion entre modelos
  	#@usuario.perfil ||= Perfil.new
  	
    # No funciona build_perfil
    # Con validaciones, al crear uno nuevo, quiere que cumpla con ellas
    # Con build_perfil, es un alias de new para relaciones
    # Con build esquiva las validaciones 
     @usuario.perfil ||= @usuario.build_perfil

    # Se asigna a @perfil el perfil nuevo o existente
  	@perfil = @usuario.perfil
  	# En su vista esta el formulario de perfil

  end

  def update

  	# Viene de la vista perfil/show
  	# Rails 5 pide que no se pase el usuario entero,
  	# si no solamente la id.
  	@usuario = User.find(current_user.id)
  	@perfil = @usuario.perfil

  	respond_to do |format|
  		# No funciona build_perfil
      # Se cambia el metodo debido a @usuario.build_perfil
      # Otro metodo provocado por la relacion, de la clase de relaciones...
      if @usuario.create_perfil(param_perfil)

      # def param_perfil crea la whitelist de atributos
  		#if @usuario.perfil.update_attributes(param_perfil)
  			# Se devuelve a la vista users/show del usuario por redirect_to
  			# @usuario = user con la :id del usuario, el path de users#show
  			format.html {redirect_to @usuario, notice: "Datos actualizados"}
  		else
  			# Si hay errores, se pasa a la vista de show.
  			# Si pasaramos, con redirect_to, por el controlador show, 
  			# recargaria los valores y no veriamos los errores.
  			# Los errores se producen por las validaciones en models/perfil.rb
  			format.html { render action: "show" }
  		end
  	end

  end

  private	# OBLIGATORIO PARA PERMITIR DATOS DE UNA WEB AL CONTROLADOR

  def param_perfil
  	params.require(:perfil).permit(:nombre, :apellidos, :sexo, :ciudad, :fecha_nacimiento)
  end

end
