class Perfil < ApplicationRecord

	# Comienza la relacion con models/user.rb
	belongs_to :user

	# Campos accesibles de perfil
	#attr_accessor :nombre, :apellidos, :sexo, :fecha_nacimiento, :ciudad

	# En Rails 3.2, comentado:
	# attr_accesible :title, :body

	## Valdaciones

	# CAMPOS = %w(nombre apellidos sexo ciudad)
	# SEXO = ["Hombre", "Mujer"]

	# validates :nombre, :apellidos, :sexo, :fecha_nacimiento, :ciudad, :presence => true

	# # Tamaños
	# validates :nombre, :apellidos, :length => {
	# 	:maximum => 20,
	# 	:minimum => 6,
	#   },
	#   :format => { :with => /\A[A-Za-z]*\z/,
	# 	  :message => "Solamente letras, por favor."	# Mensaje si no se cumple la RegExp
	# 	}

	# validates :ciudad, :length => { :maximum => 30 },
	#   :format => { :with => /\A[A-Za-z]*\z/,
	# 	  :message => "Solamente letras, por favor."	# Mensaje si no se cumple la RegExp
	# 	}

	# validates :sexo, :inclusion => { :in => SEXO } # Error si :sexo no esta en los valores de SEXO


end
