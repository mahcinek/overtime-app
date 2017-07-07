require 'rails_helper'
require 'pry'

RSpec.describe Post, type: :model do
  describe "Creation" do
  	before do

      @user= FactoryGirl.create(:user)
      @post = Post.new(date: Date.today, rationale: "Anything",user_id: @user.id)
  	end

  	it 'can be created' do

  		expect(@post).to be_valid
  	end

  	it 'cannot be created without a date and rationale' do
  		@post.date = nil
  		@post.rationale = nil
  		expect(@post).to_not be_valid
  	end
  end
end
