namespace :notification do
  desc "Sends SMS notifications asking to log overtime"
  task sms: :environment do
  #   User.all.each do |user|
  #   SmsTool.send_sms()
  # end
  end

  desc "Sends mail notifications asking to log overtime to managers"
  task manager_email: :environment do
    submitted_posts = Post.submitted
    admin_users=AdminUser.all
    if submitted_posts.count>0
      admin_users.each do |admin|
        ManagerMailer.email(admin).deliver_later
      end
  #   User.all.each do |user|
  #   SmsTool.send_sms()
  # end
end
  end

end
