FactoryBot.define do
  factory :admin, class: User do
    name { "Captain" }
    password { "password" }
    role { "admin" }
  end

  factory :user, class: User do
    name { "Captain" }
    password { "password" }
    role { "user" }
  end

  factory :post, class: Post do
    title { "title" }
    content { "something" }
  end

end