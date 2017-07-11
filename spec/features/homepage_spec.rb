require 'rails_helper'
describe 'Homepage' do
  it 'allows the admin to approve posts from homepage' do
    post=FactoryGirl.create(:post)
    @user = FactoryGirl.create(:admin_user)
    user=@user
    login_as(user, :scope => :user)
    visit root_path
    click_on("approve_#{post.id}")
    expect(post.reload.status).to eq('approved')

  end
end
