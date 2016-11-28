FactoryGirl.define do
  factory :normalRole, class: Role do
    name "regular user"
  end

  factory :normalUser, class: User do
    email "normal_user@ait.asia"
    password "password"
    password_confirmation "password"
    association :role, factory: :normalRole
  end

  factory :request, class: Request do
    topic "broken"
    description "toy"
    location "in front of building"
    status "opened"
    association :user, factory: :normalUser
  end
end