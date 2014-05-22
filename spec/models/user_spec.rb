require 'spec_helper'

describe User do

  before { @user = User.new(name: "James Bond", user_name: "james007", email: "james_bond@mailforever.com")}
  subject { @user }

  describe "accessors" do
    it { should respond_to(:name) }
    it { should respond_to(:email) }
    it { should respond_to(:user_name) }
  end

  describe "validations" do
    #TODO 
  end
end
