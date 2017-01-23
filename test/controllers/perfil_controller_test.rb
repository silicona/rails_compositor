require 'test_helper'

class PerfilControllerTest < ActionDispatch::IntegrationTest
  
  test "No deja acceder a index" do
    get :index
    assert_redirected_to new_user_session_path
  end

  test "No deja acceder a show" do
    get :show
    assert_redirected_to new_user_session_path
  end

  test "No deja acceder a actualizar" do
    get :update
    assert_redirected_to new_user_session_path
  end



  # test "should get index" do
  #   get perfil_index_url
  #   assert_response :success
  # end

  # test "should get show" do
  #   get perfil_show_url
  #   assert_response :success
  # end

  # test "should get update" do
  #   get perfil_update_url
  #   assert_response :success
  # end

end
