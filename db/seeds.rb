@user=User.create(email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Jon", last_name: "Snow")
@admin=AdminUser.create(email: "admin@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Admin", last_name: "adm")


100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post}, rationale content", user_id: @user.id, status: 0)
end

puts "100posts created"
