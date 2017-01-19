require 'rails_helper'

describe ProductsController, :type => :controller do
  
  let(:user) { FactoryGirl.create(:user) }
  
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
		    	sign_in user
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
		    	sign_in user
		    	@product = FactoryGirl.create(:product)
		    	patch :update, id: @product.id
		    end
		    	it "redirects to the updated product" do
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
				sign_in user
	    		delete :destroy, id: @product.id
	    		response.should redirect_to products_url
			end
		end
	end
end