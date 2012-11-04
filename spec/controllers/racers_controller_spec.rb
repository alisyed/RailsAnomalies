require 'spec_helper'
require 'factory_girl'

describe RacersController do
  let!(:my_model) { Factory.create(:racer) }

  describe "GET 'race'" do
    it "returns http success" do
      get 'race'
      response.should be_success
    end
  end

  describe "JSON GET 'race'" do
    it "returns json response" do
      get 'race', :format => :json
      response.body.should == my_model.to_json
    end
    it "executes the 'if' block and should immediately return from it" do
      get 'race', :format => :json
      assigns(:was_in_if_block).should == true
      assigns(:was_outside_if_block).should == false #the if block has a return, so this should be false!
    end
    it "executes fine if the 'if' block is not executed" do
      my_model.update_attribute(:name,"jane")
      get 'race', :format => :json
      assigns(:was_in_if_block).should == false
      assigns(:was_outside_if_block).should == true
    end

  end
end
