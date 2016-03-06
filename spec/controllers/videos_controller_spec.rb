require 'spec_helper'

describe VideosController do
  describe "GET show" do
    it "sets the requested video to @video for authenticated users" do
      session[:user_id] = Fabricate(:user).id
      video = Fabricate(:video)
      get :show, id: video.id
      expect(assigns(:video)).to eq(video)
    end

    it "sets @reviews for authenticated users" do
      session[:user_id] = Fabricate(:user).id
      video = Fabricate(:video)
      review1 = Fabricate(:review, video: video)
      review2 = Fabricate(:review, video: video)
      get :show, id: video.id
      expect(assigns(:reviews)).to match_array([review1, review2 ])
    end
  end

    it "redirects unauthenticated users to the sign_in page" do
      video = Fabricate(:video)
      get :show, id: video.id
      expect(response).to redirect_to sign_in_path
    end
  
  describe "POST search" do
    it "returns @result of a video(s) relating to a search_term for authenticated users" do
      session[:user_id] = Fabricate(:user).id
      futurama = Fabricate(:video, title: "futurama")
      post :search, search_term: "rama"
      expect(assigns(:results)).to eq([futurama])
    end

    it "redirects unauthenticated users to the sign_in page" do
      futurama = Fabricate(:video, title: "futurama")
      post :search, search_term: "rama"
      expect(response).to redirect_to sign_in_path
    end
  end
end