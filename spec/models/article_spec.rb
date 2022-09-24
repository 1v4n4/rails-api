require 'rails_helper'

RSpec.describe Article, type: :model do
  describe '#validations' do
    let(:article) { build(:article) }

    it 'creates a valid article' do
      # article = Article.create({title: 'Article title', content: 'Article content'})
      # article = FactoryBot.create(:article)
      # article = build(:article) # no need to save an article

      expect(article).to be_valid # article.valid == true
    end

    it 'has an invalid title' do
      article = build(:article, title: '')
      expect(article).not_to be_valid
      expect(article.errors[:title]).to include("Can't be blank")
    end
  end
end
