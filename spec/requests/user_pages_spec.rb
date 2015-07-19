require 'spec_helper'

describe "UserPages" do
  subject { page }
  describe "creating new users" do
    before { visit signup_path }
    it { should have_title 'MailForever | Sign up' }
  end
end
