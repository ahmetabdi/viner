require 'rspec'
require 'spec_helper'

describe Viner::Client do
  describe "When authenticating" do

    before(:each) do
      @client = Viner::Client.new
    end

    it "should login" do
      response = @client.login(VINE_USERNAME, VINE_PASSWORD)
      response.success.should be_true
    end

    it "should not login" do
      response = @client.login('fake', 'fake')
      response.success.should be_false
    end

  end

  describe "When logging out" do
    before(:each) do
      @client = Viner::Client.new
    end

    it "should logout" do
      @client.login(VINE_USERNAME, VINE_PASSWORD)
      response = @client.logout
      response.success.should be_true
    end
  end

  describe "When authenticated" do
    before(:each) do
      @client = Viner::Client.new
      @client.login(VINE_USERNAME, VINE_PASSWORD)
    end

    it "should give popular vines" do
      response = @client.popular
      response.success.should be_true
    end

    it "should give vines by tag" do
      response = @client.tag("cats")
      response.success.should be_true
    end

    it "should give back my profile" do
      response = @client.profile
      response.success.should be_true
    end

    it "should give a users profile" do
      response = @client.profile(912392711326285824)
      response.success.should be_true
    end

    it "should get a single post" do
      response = @client.posts(255)
      response.success.should be_true
    end

    it "should get your notifications" do
      response = @client.notifications
      response.success.should be_true
    end

  end
end