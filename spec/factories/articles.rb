FactoryBot.define do
  factory :article do
    title { "Article title" }
    content { "Article content" }
    slug { "factory-article" }
  end
end
