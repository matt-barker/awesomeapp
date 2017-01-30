require 'rails_helper'

describe ProductsController, :type => :controller do
  
  let(:admin) { FactoryGirl.create(:admin) }
  
  context 'GET #index' do
    before do
      get :index
    end

    it 'responds with a HTTP 200 status code' do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      expect(response).to render_template('index')
    end
	end

	describe 'POST #create' do
		context 'Successful create' do	
		    before do
		    	sign_in admin
		    	post :create, product: FactoryGirl.create(:product)
		    end
			it "redirects to the products index" do
				response.should redirect_to products_path
			end
		end
	end

	describe 'PUT #update' do
		context 'Successful update' do
		    before do
		    	
		    	@product = FactoryGirl.create(:product)
		    	
		    end
		    	it "redirects to the updated product" do
		    		sign_in admin
		    		patch :update, id: @product.id
	    		response.should redirect_to @product
	    	end
	    end
	end

	describe 'DELETE destroy' do
		context 'Successful delete' do
			before do
				@product = FactoryGirl.create(:product)
			end
			it "redirects to products#index" do
				sign_in admin
	    		delete :destroy, id: @product.id
	    		response.should redirect_to products_url
			end
		end
	end
end