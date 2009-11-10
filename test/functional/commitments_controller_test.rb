require 'test_helper'

class CommitmentsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Commitment.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Commitment.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Commitment.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to commitment_url(assigns(:commitment))
  end
  
  def test_edit
    get :edit, :id => Commitment.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Commitment.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Commitment.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Commitment.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Commitment.first
    assert_redirected_to commitment_url(assigns(:commitment))
  end
  
  def test_destroy
    commitment = Commitment.first
    delete :destroy, :id => commitment
    assert_redirected_to commitments_url
    assert !Commitment.exists?(commitment.id)
  end
end
