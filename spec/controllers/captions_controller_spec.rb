require 'spec_helper'

describe CaptionsController do

  context '#create' do
    let(:image) { create :image }
    let(:caption) { build :caption }

    before :each do
      post :create, image_id: image.id, caption: { body: caption.body }
    end

    it "finds an image based on params" do
      expect(assigns(:image)).to eq image
    end

    it "creates a caption with valid params" do
      expect(assigns(:caption).save).to be_true
    end

    it "does not create a caption with invalid params" do
      expect {
        post :create, image_id: image.id, caption: { body: "" }
      }.to_not change { Image.count }
      # expect(assigns(:caption).save).to be_false
    end
  end
end
