require 'spec_helper'

describe "user auth" do

  context "sign up" do

    it "should be able to create a log in" do
      visit new_user_path
      fill_in 'Name', with: 'something'
      fill_in 'Password', with: 'password'
      expect{click_on 'Create User'}.to change{User.count}.by(1)
    end


  end

end