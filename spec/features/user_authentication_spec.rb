require 'spec_helper'

describe "user auth" do

  context "sign up" do
    let!(:user){ build :user }

    it "should be able to create a log in" do
      visit new_user_path
      fill_in 'Name', with: user.name
      fill_in 'Password', with: user.password
      expect{click_on 'Create User'}.to change{User.count}.by(1)
    end

    it "should not create a log in if credentials are invalid" do
      visit new_user_path
      fill_in 'Name', with: user.name
      expect{click_on 'Create User'}.to change{User.count}.by(0)
    end
  end

end