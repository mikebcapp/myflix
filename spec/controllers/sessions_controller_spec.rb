require 'spec_helper'

describe SessionsController do
  describe "GET new" do
    it "redirects authenticated users to the home page" do
      session[:user_id] = Fabricate(:user).id
      get :new
      expect(response).to redirect_to home_path
    end

    it "renders the new page for unauthenticated users" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST create" do
    context "with valid credentials" do
      it "puts the signed in user in the session" do
        bob = Fabricate(:user)
        post :create, {email: bob.email, password: bob.password} #Don't need parens
        expect(session[:user_id]).to eq(bob.id)
      end 

      it "redirects to the home page" do
        bob = Fabricate(:user)
        post :create, {email: bob.email, password: bob.password} #Don't need parens
        expect(response).to redirect_to home_path
      end

      it "sets the success message" do
        bob = Fabricate(:user)
        post :create, {email: bob.email, password: bob.password}
        expect(flash[:success]).not_to be_blank
      end
    end

    context "with invalid credentials" do
      it "does not put the signed in user in the session" do   
        bob = Fabricate(:user)
        post :create, {email: bob.email, password: bob.password + 'make_pw_fail'}
        expect(session[:user_id]).to be_nil
      end

      it 'redirects to the sign in page' do
        bob = Fabricate(:user)
        post :create, {email: bob.email, password: bob.password + "make_pw_fail"}
        expect(response).to redirect_to sign_in_path
      end

      it 'sets the error message' do
        bob = Fabricate(:user)
        post :create, {email: bob.email, password: bob.password + 'make_pw_fail'}
        expect(flash[:danger]).not_to be_blank
      end  
    end
  end

  describe "GET destroy" do
    it "clears the user session" do
      session[:user_id] = Fabricate(:user).id
      get :destroy
      expect(session[:user_id]).to be_nil
    end

    it " redirects to the root path" do
      session[:user_id] = Fabricate(:user).id
      get :destroy
      expect(response).to redirect_to root_path
    end

    it "sets the info notice" do
      session[:user_id] = Fabricate(:user).id
      get :destroy
      expect(flash[:info]).to be_present
    end
  end  
end

