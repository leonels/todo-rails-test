require 'spec_helper'

describe ListsController do
	describe "GET #index JSON" do
	  it "Lists index action should respond to JSON" do
	    get :index, :format => :json
	    response.should be_success
	  end
	end

	describe "GET #show JSON" do
    list = List.new(title: "To-Do Rails Test")
    list.save
	  
    it "Lists show action should respond to JSON" do
	    get :show, id: list.id, :format => :json
	    response.should be_success
	  end

    it "Lists edit action should respond to JSON" do
      get :edit, id: list.id, :format => :json
      response.should be_success
    end

	end
end
