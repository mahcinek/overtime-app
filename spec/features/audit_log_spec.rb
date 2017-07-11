require 'rails_helper'

describe 'AuditLog Feature' do
before do
  FactoryGirl.create(:audit_log)
  @user = FactoryGirl.create(:admin_user)
  user=@user
  login_as(user, :scope => :user)
end

  describe 'index' do
    it 'has an index page' do
      visit audit_logs_path
      expect(page.status_code).to eq(200)
    end

    it 'renders audit log content' do
      visit audit_logs_path
      expect(page).to have_content(/JON/)
    end
it 'cannot be accessed by non admin user' do
  logout(:user)
  user = FactoryGirl.create(:user)
  login_as(user, :scope => :user)
  visit audit_logs_path
  expect(current_path).to eq(posts_path)
end
  end
end
