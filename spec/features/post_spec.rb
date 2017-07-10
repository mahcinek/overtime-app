require 'rails_helper'

describe 'navigate' do
  before do
    @user = FactoryGirl.create(:admin_user)
    user=@user
    login_as(user, :scope => :user)
  end

  describe 'index' do
    before do
      visit posts_path
    end

  	it 'can be reached successfully' do
  		expect(page.status_code).to eq(200)
  	end

  	it 'has a title of Posts' do
  		expect(page).to have_content(/Posts/)
  	end

    it 'has a list of posts' do
      post1 = FactoryGirl.create(:post)
      post2 = FactoryGirl.create(:second_post)
      visit posts_path
    end
    it 'has a scope so post creators can see their posts'do
    sam=User.create(first_name: 'Sam', last_name: 'Guplix', email: 'sam@test.com', password: "asdfasdf", password_confirmation: 'asdfasdf')
    post1 = Post.create(date: Date.today, rationale: "11111", user_id: @user.id, overtime_request: 4.5)
    post2 = Post.create(date: Date.today, rationale: "2222222", user_id: @user.id, overtime_request: 4.5)
      post_from_other_user=Post.create(date: Date.today, rationale: "SamSamSam", user_id: sam.id, overtime_request: 2.5)
      visit posts_path
      expect(page).to_not have_content(/SamSamSam/)
    end
  end

  describe 'new' do
    it 'has a lnk form homepage' do
    visit root_path
    click_link("new_post_from_nav")
    expect(page.status_code).to eq(200)
  end
end

describe 'delete' do
  it 'can be deleted' do
    @post=FactoryGirl.create(:post)
    @post.update(user_id: @user.id)
     visit posts_path
     click_link("delete_post_#{@post.id}_from_index")
     expect(page.status_code).to eq(200)
  end
end

  describe 'creation' do
  	before do
  		visit new_post_path
  	end

  	it 'has a new form that can be reached' do
  		expect(page.status_code).to eq(200)
  	end

  	it 'can be created from new form page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Some rationale"
      click_on "Save"

      expect(page).to have_content("Some rationale")
  	end

    it 'will have a user associated it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "User Association"
      click_on "Save"

      expect(User.last.posts.last.rationale).to eq("User Association")
    end
  end

  describe 'edit' do
before do
  @user = FactoryGirl.create(:admin_user)
  @post=Post.create(date: Date.today, rationale: "blah blah", user_id: @user.id, overtime_request: 0.5)
end

    it 'can be reached by clicking edit on index page' do
      visit posts_path
      #click_link("edit_#{@post.id}")
      expect(page.status_code).to eq(200)
    end

    it 'can be edited'do
          visit edit_post_path(@post)
          fill_in 'post[date]', with: Date.today
          fill_in 'post[rationale]', with: "Edited content"
          click_on "Save"
          expect(page).to have_content("Edited content")

  end
  end
end
