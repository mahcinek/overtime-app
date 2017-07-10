require 'rails_helper'
require 'pry'

RSpec.describe Post, type: :model do
  describe "Creation" do
  	before do

      @user= FactoryGirl.create(:user)
      @post = Post.create(date: Date.today, rationale: "Anything",user_id: @user.id, overtime_request: 0.5)
  	end

  	it 'can be created' do

  		expect(@post).to be_valid
  	end

  	it 'cannot be created without a date,rationale and overtime request' do
  		@post.date = nil
  		@post.rationale = nil
      @post.overtime_request=nil
  		expect(@post).to_not be_valid
  	end
    it 'has an ovetime_request greater than 0.0' do
      @post.overtime_request=0.0
      expect(@post).to_not be_valid
    end
  end
end
