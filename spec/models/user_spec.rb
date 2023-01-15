require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    context "when email is not present" do
      it "should not be valid" do
        user = User.new(email: nil)
        expect(user).to_not be_valid
      end
    end
    # context "when email is present" do
    #   it "should be valid" do
    #     user = User.new(email: "user1@example.com")
    #     expect(user).to be_valid
    #   end
    # end
    context "when email is not unique" do
      it "should not be valid" do
        User.create(email: "user@example.com", password: "password", username: "username")
        user = User.new(email: "user@example.com")
        expect(user).to_not be_valid
      end
    end
    context "when password is not present" do
      it "should not be valid" do
        user = User.new(password: nil)
        expect(user).to_not be_valid
      end
    end
    context "when password is present but less than 6 characters" do
      it "should not be valid" do
        user = User.new(password: "abcde")
        expect(user).to_not be_valid
      end
    end
    # context "when password is present and more than 6 characters" do
    #   it "should be valid" do
    #     user = User.new(password: "abcdef")
    #     expect(user).to be_valid
    #   end
    # end
    context "when username is not present" do
      it "should not be valid" do
        user = User.new(username: nil)
        expect(user).to_not be_valid
      end
    end
    # context "when username is present" do
    #   it "should be valid" do
    #     user = User.new(username: "username")
    #     expect(user).to be_valid
    #   end
    # end
    context "when username is not unique" do
      it "should not be valid" do
        User.create(email: "user@example.com", password: "password", username: "username")
        user = User.new(username: "username")
        expect(user).to_not be_valid
      end
    end
  end
end
