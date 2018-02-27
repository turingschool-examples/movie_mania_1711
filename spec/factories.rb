FactoryBot.define do
  factory :award_movie do
    
  end
  factory :movie do
    sequence(:title) { |n| "Title #{n}" }
    description "Maybe brad pitt is in it?"
    director
  end

  factory :director do
    sequence(:name)  { |n| "Name #{n}" }
  end

  factory :admin, class: User do
    username 'something'
    password 'something'
    role 1
  end

  factory :user do
    username 'something'
    password 'something'
    role 0
  end

  factory :hello, class: Director do
    name "Ilana"
  end

  factory :award do
    sequence(:title) { |n| "something goes here #{n}" }
    user
  end

end
