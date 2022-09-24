FactoryBot.define do
  sequence :slug do |n|
    "article#{n}"
  end

  factory :article do
    title { 'Article title' }
    content { 'Article content' }
    slug
  end
end
