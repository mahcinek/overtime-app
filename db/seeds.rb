@user=User.create(email: "test@test.com",
                  password: "asdfasdf",
                  password_confirmation: "asdfasdf",
                  first_name: "Jon",
                  last_name: "Snow",
                  phone:"697294429")
@admin=AdminUser.create(email: "admin@test.com",
                        password: "asdfasdf",
                        password_confirmation: "asdfasdf",
                        first_name: "Admin",
                        last_name: "adm",
                        phone:"697294429")
puts '2 users created'


  AuditLog.create!(start_date: Date.today, user_id: @user.id, status: 0, start_date:(Date.today - 6.days))
  AuditLog.create!(start_date: Date.today, user_id: @user.id, status: 0, start_date:(Date.today - 13.days))
  AuditLog.create!(start_date: Date.today, user_id: @user.id, status: 0, start_date:(Date.today - 20.days))

10.times do |post|
  Post.create!(date: Date.today, rationale: "#{post}, Contrary to popular belief, Lorem
  Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC,
   making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia,
   looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word
   in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of
   (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular
    during the Renaissance. The first line of Lorem Ipsum, comes from a line in section 1.10.32.", user_id: @user.id, status: 0, overtime_request: 2.5)
end



puts "3 audit logs"
100.times do |post|
	Post.create!(date: Date.today, rationale: "#{post} rationale content Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", user_id: @user.id, overtime_request: 2.5)
end
puts "100 posts created"
