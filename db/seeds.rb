# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
%i[music party disco].each do |category|
  Category.create!(name: category)
end

if Rails.env.development?
  admin = AdminUser.find_or_initialize_by(email: 'admin@example.com')
  admin.update!(password: 'password', password_confirmation: 'password')
end

user = User.find_or_initialize_by(email: 'user@example.com')
user.update!(password: 'password')

20.times do
  Event.create!(
    title: "Event#{Time.now.to_i}",
    body: "Body#{Time.now.to_i}",
    published_at: Time.now,
    user: user,
    category: Category.last
  )
end
