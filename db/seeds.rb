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

10.times do |post|
  Post.create!(date: Date.today, rationale: "#{post}, rationale content", user_id: @user.id, status: 0, overtime_request: 2.5)
end
12.times do |audit_log|
  AuditLog.create!(start_date: Date.today, user_id: @user.id, status: 0, start_date:(Date.today - 6.days))
end
puts "10 audit logs"
10.times do |post|
  Post.create!(date: Date.today, rationale: "#{post}, rationale content", user_id: @user.id, status: 1, overtime_request: 1.5)
end
10.times do |post|
  Post.create!(date: Date.today, rationale: "#{post}, rationale content", user_id: @user.id, status: 2, overtime_request: 4.5)
end
10.times do |post|
  Post.create!(date: Date.today, rationale: "#{post}, rationale admin content", user_id: @admin.id, status: 0, overtime_request: 0.5)
end

puts "100 posts created"
