FactoryBot.define do
  factory :award do
    title "The Eupanifahorious Award For Exploration Of Shrubberies in loving memory of Chrisp Ratt and rememberance of ...um.... wait, what was his name? He played in that one movie? Yeah, the one where he gets lost and has to find LIAM NEESON."
  end
  factory :movie do
    sequence(:title) { |n| "Title #{n}" }
    description "Maybe prad bitt is in it?"
    director
  end

  factory :director do
    sequence(:name)  { |n| "Name #{n}" }
  end

  factory :hello, class: Director do
    name "Ilana"
  end

  factory :admin, class: User do
    username "Rum N' Coca Cola"
    password "Working for the amcidala"
    role 1
  end

end
