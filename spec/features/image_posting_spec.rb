require 'spec_helper'

describe "image posting", :js => true do
  let!(:user) { User.create! name: 'Bill', password: 'password' }
  let!(:image) { Image.create! title: 'Puppy', url:'http://www.puppy.com', user_id: user.id }

  context "on new image form page" do

    it "creates new image" do
      visit new_user_image_path(user)
      click_on('Load Image')
      # expect(current_path).to eq user_image_path(user.id, image)
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