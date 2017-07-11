class StaticController < ApplicationController
  def home
    @pending_approvals=Post.where(status: 'submited')
    @recent_audit_items=AuditLog.last(10)
  end
end
