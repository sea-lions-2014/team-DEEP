require 'spec_helper'

describe "image posting", :js => true do
  let!(:user) { User.create! name: 'Bill', password: 'password' }
  let!(:image) { Image.create! title: 'Puppy', url:'http://www.puppy.com', user_id: user.id }
  context "on new image form page" do
    it "creates new image" do
      visit new_user_image_path(user)
      click_on('Create Image')
      p "#{Image.last} ------------------------"
      expect(current_path).to eq user_image_path(user, Image.last)
    end
  end
  context "on image display page" do
    it "displays an image by id" do
      puts image.inspect
      visit user_image_path(user, image)
      expect(page).to have_content(image.title)
    end
  end




end