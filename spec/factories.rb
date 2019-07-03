FactoryBot.define do
  factory :admin, class: User do
    email { "admin@aaa.com" }
    password { "password" }
    password_confirmation { "password" }
    role { "admin" }
  end

  factory :user, class: User do
    email { "user@a.com" }
    password { "password" }
    password_confirmation { "password" }
    role { "user" }
  end

  factory :post, class: Post do
    title { "title" }
    content { "something" }
  end

end