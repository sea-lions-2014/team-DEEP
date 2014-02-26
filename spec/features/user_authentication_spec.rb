require 'spec_helper'

describe "user auth", js: true do

  context "sign up" do
    let!(:user){ build :user }

    it "should be able to create a log in" do
      visit new_user_path
      fill_in 'Name', with: 'username'
      fill_in 'Password', with: 'password'
      # more of a controller type of test. I'm more interested to what the user will see after a successful login.
      expect{click_on 'Create User'}.to change{User.count}.by(1)
    end

    it "should not create a log in if credentials are invalid" do
      visit new_user_path
      fill_in 'Name', with: user.name
      # more of a controller type of test. I'm more interested to what the user will see after an unsuccessful login.
      expect{click_on 'Create User'}.to change{User.count}.by(0)
    end
  end

  context "sign in" do
    let!(:user){ create :user }
    before :each do
      visit login_path
    end

    it "should be able to log in with correct credentials" do
      fill_in 'Name', with: user.name
      fill_in 'Password', with: 'password'
      click_on 'Log in'
      expect(current_path).to eq user_path(user)
    end

    it "should not be able to log in with incorrect credentials" do
      fill_in 'Name', with: user.name
      click_on 'Log in'
      expect(current_path).to eq login_path
    end
  end

  context "sign out" do
    let!(:user){ create :user }
    before :each do
      visit login_path
      fill_in 'Name', with: user.name
      fill_in 'Password', with: 'password'
      click_on 'Log in'
    end

    it "should log a user out" do
      click_on 'Sign out'
      expect(current_path).to eq root_path
    end
  end

end
