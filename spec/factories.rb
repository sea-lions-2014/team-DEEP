FactoryGirl.define do

  factory :user do
    sequence(:name){ |n| "Name#{n}" }
    password "password"
  end

  factory :image do
    sequence(:url){ |n| "http://www.example#{n}.com" }
    sequence(:title){ |n| "title#{n}" }
    user
  end

  factory :caption do
    sequence(:body){ |n| "my body #{n}" }
    user
    image
  end

end