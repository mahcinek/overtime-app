FactoryGirl.define do
  factory :post do
    date Date.today
    rationale "some raca"
    user
  end

  factory :second_post, class: "Post" do
    date Date.yesterday
    rationale "some more content rac"
    user
  end
end
