FactoryGirl.define do
  factory :user, class: User do
    email 'teera@ait.ac.th'
    password "password"
    password_confirmation "password"

    factory :admin do
      after(:create) { |user| user.add_role(:admin) }
    end
  end
end
