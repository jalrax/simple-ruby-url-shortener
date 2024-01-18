FactoryBot.define do
  factory :simple_link do
    sequence(:url) { |n| "https://github.com/jalrax/simple-ruby-url-shortener-#{n}" }
    short_url { nil }
    click_count { 0 }
  end
end
