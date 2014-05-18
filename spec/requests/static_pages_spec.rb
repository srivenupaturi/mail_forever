require 'spec_helper'

describe "StaticPages" do
  describe "#home" do
    it "should return content for main page" do
      visit root_path
      expect(page).to have_content('MailForever')
    end

    it "should have title" do
      visit root_path
      page.should have_title 'MailForever'
    end
  end

  describe "#about" do
    it "should return content for About" do
      visit about_path
      expect(page).to have_content('About')
    end

    it "should have title" do
      visit about_path
      page.should have_title 'MailForever | About'
    end
  end

  describe "#help" do
    it "should return content for Help" do
      visit help_path
      expect(page).to have_content('Help')
    end

    it "should have the right title" do
      visit help_path
      page.should have_title 'MailForever | Help'
    end
  end

  describe "#Contact" do
    it "should return content for Contact" do
      visit contact_path
      expect(page).to have_content('Contact')
    end

    it "should have the right title" do
      visit contact_path
      page.should have_title 'MailForever | Contact'
    end
  end
end
