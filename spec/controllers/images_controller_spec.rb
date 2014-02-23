require 'spec_helper'

describe ImagesController do

  context "#new" do
    let!(:user) { create :user }
    let!(:image) { build :image }

    before :each do
      get :new, user_id: user.id
    end

    it "should find the logged in user" do
      expect(assigns(:user)).to eq user
    end

    it "should initialize an empty image with a user id" do
      expect(assigns(:image).user_id).to eq user.id
      expect(assigns(:image).url).to be_nil
    end
  end

  context "#create" do
    let!(:user) { create :user }
    let(:image) { build :image }

    before :each do
      post :create, user_id: user.id, image: { title: image.title, url: image.url }
    end

    it "should find the logged in user" do
      expect(assigns(:user)).to eq user
    end

    it "should create an image based on params passed in" do
      expect(assigns(:image).save).to be true
      expect(assigns(:image).url).to eq image.url
    end

    it "should not save an image with invalid params" do
      post :create, user_id: user.id, image: { title: image.title }
      expect(assigns(:image).save).to be false
    end
  end

  context '#show' do
    let!(:user) { create :user }
    let!(:image) { create :image }

    before :each do
      get :show, id: image.id
    end

    it "should find the desired image by params" do
      expect(assigns(:image)).to eq image
    end

    it "should initialize an empty caption" do
      expect(assigns(:caption).id).to be_nil
      expect(assigns(:caption).body).to be_nil
    end
  end

end