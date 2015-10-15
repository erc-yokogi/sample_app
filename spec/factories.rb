FactoryGirl.define do
  factory :user do
    name     "yokogi"
    email    "yokogi@erve.com"
    password "foobar"
    password_confirmation "foobar"
  end
end