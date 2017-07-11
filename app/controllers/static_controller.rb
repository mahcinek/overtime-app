class StaticController < ApplicationController
  def home
    if admin_types.include?(current_user.type)
    @pending_approvals=Post.submited
    @recent_audit_items=AuditLog.last(10)
  else
    #sth else
  end
  end
end
