require 'rails_helper'

RSpec.describe Article, type: :model do
  it "creates an article" do
    # article = Article.create({title: 'Article title', content: 'Article content'})
    # article = FactoryBot.create(:article)
    article = create(:article)
    expect(article.title).to eq('Article title')
  end
end
