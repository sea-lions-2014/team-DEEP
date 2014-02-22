require 'spec_helper'

describe "homepage" do
  context "sign in" do
    it "should have a sign in link" do
      visit root_path
      expect(page.find_link('Sign In')).to be_true
    end
  end
end