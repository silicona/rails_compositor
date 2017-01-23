require 'test_helper'

class PerfilTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Perfil nuevo erroneo" do
    perfil = perfiles(:one)
    perfil.save
    assert perfil.valid?
  end

  # test "Perfil nuevo correcto" do
  # 	usuario = :one
  #   perfil = Perfil.new
  #   perfil.nombre = "Pruebanombre"
  #   perfil.apellidos = "Pruebaapelidos"
  #   perfil.sexo = "Hombre"
  #   perfil.fecha_nacimiento = "1981-05-01"
  #   perfil.ciudad = "Sevilla"
  #   perfil.user_id = 5
  #   usuario.perfil.save
  #   assert usuario.perfil.valid?
  # end
end
