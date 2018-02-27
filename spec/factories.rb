FactoryBot.define do
  factory :movie do
    sequence(:title) { |n| "Title #{n}" }
    description "Maybe brad pitt is in it?"
    director
  end

  factory :director do
    sequence(:name)  { |n| "Name #{n}" }
  end

  factory :hello, class: Director do
    name "Ilana"
  end

  factory :user do
    sequence(:username) { |n| "user #{n}" }
    password 'password'
    role 0
  end

  factory :award do
    sequence(:title) { |n| "Award #{n}" }
  end
end
