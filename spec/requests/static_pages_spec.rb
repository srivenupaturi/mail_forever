require 'spec_helper'

describe "StaticPages" do
  describe "#home" do
    it "should return content for main page" do
      visit '/static_pages/home'
      expect(page).to have_content('MailForever')
    end
  end

  describe "#about" do
    it "should return content for About" do
      visit '/static_pages/about'
      expect(page).to have_content('About')
    end
  end

  describe "#help" do
    it "should return content for Help" do
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end
  end
end
