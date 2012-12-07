FactoryGirl.define do
  factory :project do
    title "Lorem ipsum"
    image File.open(Rails.root.join('spec/fixtures/image.jpg'))
  end
end
