require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  test "Usuario nuevo correcto" do
  	usuario = users(:one)
  	usuario.save
  	assert usuario.valid?
  end

end
