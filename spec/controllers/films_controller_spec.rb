require File.dirname(__FILE__) + '/../spec_helper'

describe FilmsController do
  
  it "index action should render index template" do
    Film.expects(:all).returns([])
    
    get :index
    
    response.should render_template(:index)
  end

  it "show action should render show template" do
    film = Factory(:film)
    Film.expects(:find).with(film.id).returns(film)
    
    get :show, :id => film.id
    
    response.should render_template(:show)
  end

  describe 'admin actions' do 
    before(:each) do
      sign_in :admin, Factory(:admin)
    end
   
    it "new action should render new template" do
      film = Factory.build(:film)
      Film.expects(:new).returns(film)
    
      get :new
    
      response.should render_template(:new)
    end

    it "create action should render new template when model is invalid" do
      film = Factory.build(:film)
      Film.expects(:new).with('x' => 'x').returns(film)
      film.expects(:save).returns(false)
    
      post :create, :film => {'x' => 'x'}
        
      response.should render_template(:new)
    end

    it "create action should redirect when model is valid" do
      film = Factory(:film)
      Film.expects(:new).with('x' => 'x').returns(film)
      film.expects(:save).returns(true)
    
      post :create, :film => {'x' => 'x'}
    
      response.should redirect_to(film_url(assigns[:film]))
    end

    it "edit action should render edit template" do
      film = Factory(:film)
      Film.stubs(:find).with(film.id).returns(film)
    
      get :edit, :id => film.id
    
      response.should render_template(:edit)
    end

    # it "update action should render edit template when model is invalid" do
    #   film = Factory(:film)
    #   Film.any_instance.stubs(:valid?).returns(false)
    #   put :update, :id => film.id
    #   response.should render_template(:edit)
    # end
    # 
    # it "update action should redirect when model is valid" do
    #   film = Factory(:film)
    #   Film.any_instance.stubs(:valid?).returns(true)
    #   put :update, :id => film.id
    #   response.should redirect_to(film_url(assigns[:film]))
    # end
  
    it "should update action should render edit template when model is invalid" do
         film = Factory(:film)
         Film.expects(:find).with(film.id).returns(film)
         film.expects(:update_attributes).with('x' => 'x', 'y' => 'y').returns(false)
         put :update, :id => film.id, :film => {'x' => 'x', 'y' => 'y'}
         response.should render_template(:edit)
       end

       it "should update action should redirect when model is valid" do
         film = Factory(:film)
         Film.expects(:find).with(film.id).returns(film)
         film.expects(:update_attributes).with('x' => 'x', 'y' => 'y').returns(true)
         put :update, :id => film.id, :film => {'x' => 'x', 'y' => 'y'}
         response.should redirect_to(film_url(assigns[:film]))
       end

    it "destroy action should destroy model and redirect to index action" do
      film = Film.create!(:name => "test",
                          :url => "test",
                          :description => "test",
                          :rating => 0)
      lambda do
        delete :destroy, :id => film.id
        response.should redirect_to(films_url)
      end.should change(Film, :count).by(-1)
    end
  end
end
