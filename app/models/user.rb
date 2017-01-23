class User < ApplicationRecord
  
  # Se crea la relacion con models/perfil.rb
  has_one :perfil

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Se pueden sobredescribir los atributos
  # validates :password, :length => {:maximum => 6}

  # Setup accessible (or protected) attributes for your model:
  # attr_accesible :name, :email, :password, :password_confirmation, :remember me


  # TEORIA

  # modulos instalados:
  # :database_authenticatable = Autentificacion de la base de datos.
  	# Encripta las contraseñas en nuestra base de datos.

  # :registerable = Ademas del proceso del registro de usuarios, 
  	# permite editar los datos de los usuarios y editarlos, 
  	#	ademas de cancelar la cuenta.

  # :recoverable = Recuperable. Da la oportunidad de resetear la contraseña,
  	# y envia un mail con las instrucciones para recuperarla.

  # :rememberable = Recordable. Controla las caraceristicas para que nuestra 
  	# aplicacion recuerde la decision del usuario marcando el check para 
  	# recordar esa cuenta.

  # :trackable = Rastreable. Un historico con los tiempos de acceso y desde
  	# que direcciones ip se ha nrealizado los acceesos.
  # :validatable = Validable. Proporciona validaciones de usuario por correo
  	# electronico, contraseña,... Se puede personalizar con nuestras validaciones.

  # Comentados por defecto en API de rails
	  # :confirmable = Modulo que envia un mail de confirmacion al registrar
	  	# un nuevo usuario.
	  	
	  # :lockable
	  # :timeoutable
	  # :omniauthable
  


  # En rails 3.2
  # Modulo disponible comentado: 
  # :token_authenticatable

  # Setup accessible (or protected) attributes for your model:
  # Estos atributos pueden usarse para acceder a los datos del usuario,
    # desde las vistas, por ejemplo en views/layout/_navigation.html.erb
    # con current_name, current_password y current_email
  # attr_accesible :name, :email, :password, :password_confirmation, :remember me

	  # current_user
	  # current_user.name 
	  # current_user.email 
	  # Password no sale ?
	  # current_user.password 

	# Con user_session, se accede a la sesion del usuario.

	# Hay que generar las vistas de Devise, para que salgan todas en el 
	# arbol de archivos.
	# rails generate devise:views


end
