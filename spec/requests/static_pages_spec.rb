require 'spec_helper'

describe "StaticPages" do
  describe "#home" do
    it "should return content for main page" do
      visit '/static_pages/home'
      expect(page).to have_content('MailForever')
    end

    it "should have title" do
      visit '/static_pages/home'
      page.should have_selector('title', :text => 'MailForever')
    end
  end

  describe "#about" do
    it "should return content for About" do
      visit '/static_pages/about'
      expect(page).to have_content('About')
    end

    it "should have title" do
      visit '/static_pages/about'
      page.should have_selector('title', :text => '| About')
    end
  end

  describe "#help" do
    it "should return content for Help" do
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end

    it "should have the right title" do
      visit '/static_pages/help'
      page.should have_selector('title', :text => '| Help')
    end
  end
end
