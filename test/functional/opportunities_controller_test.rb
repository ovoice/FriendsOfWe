require 'test_helper'

class OpportunitiesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Opportunity.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Opportunity.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Opportunity.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to opportunity_url(assigns(:opportunity))
  end
  
  def test_edit
    get :edit, :id => Opportunity.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Opportunity.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Opportunity.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Opportunity.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Opportunity.first
    assert_redirected_to opportunity_url(assigns(:opportunity))
  end
  
  def test_destroy
    opportunity = Opportunity.first
    delete :destroy, :id => opportunity
    assert_redirected_to opportunities_url
    assert !Opportunity.exists?(opportunity.id)
  end
end
