require 'rails_helper'

describe UsersController, :type => :controller do

    let(:user) { User.create!(email: 'bob@example.com', password: 'letmein1234') }
    let (:user2) {User.create!(email: 'john@example.com', password: '123456788') }
    
    describe 'GET #show' do
        context 'User is logged in' do
            before do
                sign_in user
            end
            it 'loads correct user details' do
                get :show, id: user.id
                expect(response).to have_http_status(200)
                expect(assigns(:user)).to eq user
            end
            it 'should prevent user accessing another show' do
                get :show, id: user2.id
                expect(response).to have_http_status(302)
            end
        end
    
        context 'No user is logged in' do
           it 'redirects to login' do
             get :show, id: user.id
             expect(response).to redirect_to(new_user_session_path)
            end
        end
    end
end