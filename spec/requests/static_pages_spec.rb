require 'spec_helper'

describe "StaticPages" do

  subject { page } 

  describe "#home" do
    before { visit root_path }
    it { should have_content 'MailForever' }
    it { should have_title 'MailForever' }
  end

  describe "#about" do
    before { visit about_path }
    it { should have_content 'About' }
    it { should have_title 'MailForever | About' }
  end

  describe "#help" do
    before { visit help_path }
    it { should have_content('Help') }
    it { should have_title 'MailForever | Help' }
  end

  describe "#Contact" do
    before { visit contact_path }
    it { should have_content 'Contact' }
    it { should have_title 'MailForever | Contact' }
  end
end
