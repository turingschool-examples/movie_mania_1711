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
    sequence(:username) {|n| "Username#{n}"}
    sequence(:password) {|n| "password#{n}"}
  end

end
