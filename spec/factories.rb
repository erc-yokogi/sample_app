FactoryGirl.define do
  factory :user do
#    name     "yokogi"
#    email    "yoko@erev.com"
#    password "yoko01"
#    password_confirmation "yoko01"

    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end

  end
end