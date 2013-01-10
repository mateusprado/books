require 'spec_helper'

def app
  Sinatra::Application
end

describe "service" do
  include Rack::Test::Methods
	
  before(:each) do
    User.delete_all
  end

  describe "GET on /api/v1/users/:id" do
    before(:each) do 
      User.create(
        :name => "mateus",
	:email => "mateus@mateusprado.com",
	:password => "strongpass",
	:bio => "skydive"
      )
    end

    it "should return a user by name" do
      get "/api/v1/users/mateus"
      last_response.should be_ok
      attributes = JSON.parse(last_response.body)
      attributes['user']['name'].should == "mateus"
    end

    it "should return a user with an email" do
      get "/api/v1/users/mateus"
      last_response.should be_ok
      attributes = JSON.parse(last_response.body)
      attributes['user']['email'].should == "mateus@mateusprado.com"
    end

    it "should not return a user's password" do
      get "/api/v1/users/mateus"
      last_response.should be_ok
      attributes = JSON.parse(last_response.body)
      attributes.should have_key ['password']
    end

    it "should return a user with bio" do
      get "/api/v1/users/mateus"
      last_response.should be_ok
      attributes = JSON.parse(last_response.body)
      attributes['user']['bio'].should == 'skydive'
    end

    it "should return a 404 for a user that doesn't exist" do
      get "/api/v1/users/prado"
      last_response.status.should == 404
    end
  end

  describe "POST on /api/v1/users/" do
    it "should create a user" do
      post "/api/v1/users", {
        :name => "mateus",
	:email => "mateus@mateusprado.com",
	:password => "7654",
	:bio => "southern belle"
      }.to_json
      last_response.should be_ok
      get '/api/v1/users/mateus'
      attributes = JSON.parse(last_response.body)
      attributes['user']['name'].should == "mateus"
      attributes['user']['email'].should == "mateus@mateusprado.com"
      attributes['user']['bio'].should == "southern belle"
    end
  end

  describe "PUT on /api/v1/users/" do
    it "should update a user" do
      User.create(
        :name => "hermida",
	:email => "rhruiz@hermida.com",
	:password => "s3cr3t",
	:bio => "email enginer"
      ).to_json
      put '/api/v1/users/hermida', {
      :bio => "ruby mentor"
      }.to_json
      last_response.should be_ok
      get '/api/v1/users/hermida'
      attributes = JSON.parse(last_response.body)
      attributes['user']['bio'].should == "ruby mentor"
    end
  end
end
