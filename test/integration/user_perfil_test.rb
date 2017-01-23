
require 'test_helper'

class UserPerfilTest < ActionDispatch::IntegrationTest

	# Test con usuario en BD (fixtures/users y perfiles.yml)
	test "Realizar registro y entrar al perfil" do

		# Registro de usuario
		post_via_redirect user_registration_path, :user => { :email => users(:one).email, :password => "12345"}
		assert_equal "tu cuenta fue creada", flash[:notice]

		# Salir de la sesion
		delete destroy_user_session_path
		assert_equal flash[:notice], "Sesion finalizada."
  end

  test "Login y entrar a la configuracion básica" do

		# Visitar login y validarse como usuario
		post_via_redirect destroy_user_session_path, :user => { :email => users(:one).email, :password => "12345"}
		# / es el root, se comprueba si lleva al root.
		assert_equal '/', path
		assert_equal flash[:notice], "Sesión iniciada."

		# Entrar a cambiar la configuracion básica
		get "users/edit"
		assert_response :success
	end

  test "Login y entrar al perfil" do

  	# Visitar login y validarse como usuario
		post_via_redirect destroy_user_session_path, :user => { :email => users(:one).email, :password => "12345"}
		# / es el root, se comprueba si lleva al root.
		assert_equal '/', path
		assert_equal flash[:notice], "Sesión iniciada."

		# Entrar al perfil
		# :one esta en fixtures/users.yml y perfiles.yml
		usuario = Perfil.find_by_nombre(perfiles(:one).nombre)
		get perfil_path(usuario)
		assert_response :success

	end

	# Test de nuevo usuario

	test "realizar registro" do
		# Registro de usuario
		post_via_redirect user_registration_path, :user => { :name => "santiago", :email => "curso_rails@prueba.com", :password => "12345"}
		assert_equal "tu cuenta fue creada", flash[:notice]
	end

	test "Realizar registro con usuario nuevo y entrar al perfil" do
		# Registro de usuario
		post_via_redirect user_registration_path, :user => { :name => "santiago", :email => "curso_rails@prueba.com", :password => "12345"}
		assert_equal "tu cuenta fue creada", flash[:notice]

		# Entrar al perfil
		usuario = User.find_by_name("santiago")
		get perfil_path(usuario)
		assert_response :success

		# rellenar perfil
		put_via_redirect perfil_path, :perfil => {
			:nombre => "Santiago",
			:apellidos => "Moreno", 
			:fecha_nacimiento => "1981-02-03",
			:sexo => "Hombre",
			:ciudad => "Malaga"
		}

	end

  # Mismos test en uno solo. Ojo a los parametros de :user
	# test "Realizar registro y entrar al perfil" do

	# 	# Registro de usuario
	# 	post_via_redirect user_registration_path, :user => { :name => "Santiago", :email => "curso_rails@prueba.com", :password => "12345"}
	# 	assert_equal "tu cuenta fue creada", flash[:notice]

	# 	# Salir de la sesion
	# 	delete destroy_user_session_path
	# 	assert_equal flash[:notice], "Sesion finalizada."

	# 	# Visitar login y validarse como usuario
	# 	post_via_redirect destroy_user_session_path, :user => { :email => "curso_rails@prueba.com", :password => "12345"}
	# 	# / es el root, se comprueba si lleva al root.
	# 	assert_equal '/', path
	# 	assert_equal flash[:notice], "Sesión iniciada."

	# 	# Entrar a cambiar la configuracion básica
	# 	get "users/edit"
	# 	assert_response :success

	# 	# Entrar al perfil
	# 	# :one esta en fixtures/users.yml
	# 	usuario = Perfil.find_by_nombre(perfiles(:one).nombre)
	# 	get perfil_path(usuario)
	# 	assert_response :success

	# end
end
 