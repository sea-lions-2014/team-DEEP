require 'spec_helper'

describe "image posting", :js => true do
  let!(:user) { create :user }
  let!(:image) { create :image }

  context "on new image form page" do

    it "creates new image" do
      visit new_user_image_path(user)
      fill_in 'image_url', with: image.url
      fill_in 'image_title', with: image.title
      expect{click_on 'Load Image'}.to change{Image.count}.by(1)
    end
  end

  context "on image display page" do
    it "displays an image by id" do
      visit user_image_path(user, image)
      expect(page).to have_content(image.title)
    end
  end

end