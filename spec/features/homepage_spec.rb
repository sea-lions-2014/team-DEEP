require 'spec_helper'

describe "homepage" do
  context "sign in" do
    it "should have a sign in form" do
      visit root_path
      expect(page.find_field('username')).to be_true
    end
  end
end