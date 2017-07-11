require 'rails_helper'

describe 'AuditLog Feature' do
before do
  FactoryGirl.create(:audit_log)
  @user = FactoryGirl.create(:admin_user)
  user=@user
end

  describe 'index' do
    it 'has an index page' do
      visit audit_logs_path
      expect(page.status_code).to eq(200)
    end

    it 'renders audit log content' do
      FactoryGirl.create(:audit_log)
      @user = FactoryGirl.create(:admin_user)
      user=@user
      login_as(user, :scope => :user)
      visit audit_logs_path
      expect(page).to have_content(/JON/)
    end
  end
end
