require 'spec_helper'
feature "Sign in with OAuth" do
  before(:each) do
    visit "/"
  end

  it "sign in with Facebook" do
    click_link "Sign in with Facebook"
    page.should have_content "Sign out"
  end

  it "sign in with VK" do
    click_link "Sign in with VK"
    page.should have_content "Sign out"
  end

  it "sign in with Google" do
    click_link "Sign in with Google"
    page.should have_content "Sign out"
  end
end