require 'spec_helper'

describe "image posting", :js => true do
  let!(:user) { User.create name: 'Bill', password: 'password' }
  let(:image) { Image.create title: 'Puppy', url:'www.puppy.com' }
  context "on new image form page" do
    it "creates new image" do
      visit new_user_image_path(user)
      click_on('Submit')
      expect(current_path).to eq visit new_user_image_path(user)
    end
  end



end