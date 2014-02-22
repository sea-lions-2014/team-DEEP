require 'spec_helper'

describe "user auth", js: true do

  context "sign up" do
    let!(:user){ build :user }

    it "should be able to create a log in" do
      visit new_user_path
      fill_in 'Name', with: user.name
      fill_in 'Password', with: 'password'
      expect{click_on 'Create User'}.to change{User.count}.by(1)
    end

    it "should not create a log in if credentials are invalid" do
      visit new_user_path
      fill_in 'Name', with: user.name
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
      click_on 'Sign in'
      expect(current_path).to eq user_path id: user.id
    end

    it "should not be able to log in with incorrect credentials" do
      fill_in 'Name', with: user.name
      click_on 'Sign in'
      expect(current_path).to eq login_path
    end
  end

  context "sign out" do
    let!(:user){ create :user }
    before :each do
      visit login_path
      fill_in 'Name', with: user.name
      fill_in 'Password', with: 'password'
      click_on 'Sign in'
    end

    it "should log a user out" do
      click_on 'Sign out'
      # visit user_path, id: user.id
      # expect(response).to be 403
    end
  end

end