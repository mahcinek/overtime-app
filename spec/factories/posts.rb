FactoryGirl.define do
  factory :post do
    date Date.today
    rationale "some raca"
    overtime_request 3.5
    user
  end

  factory :second_post, class: "Post" do
    date Date.yesterday
    rationale "some more content rac"
    overtime_request 0.5
    user
  end
  factory :post_from_other_user, class: "Post" do
    date Date.yesterday
    rationale "some more content rac"
    userSam
  end
end
