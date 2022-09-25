require 'rails_helper'

RSpec.describe Article, type: :model do
  describe '#validations' do  #instance method prefix #
    let(:article) { create(:article) }
    let(:article_invalid) { build(:article, title: '', content: '', slug: '') }
    let(:article_slug_invalid) { build(:article, slug: article.slug)}

    it 'creates a valid article' do
      # article = Article.create({title: 'Article title', content: 'Article content'})
      # article = FactoryBot.create(:article)
      # article = build(:article) # no need to save an article

      expect(article).to be_valid # article.valid == true
    end

    it 'has an invalid title' do
      # article = build(:article, title: '')
      aggregate_failures do
        expect(article_invalid).not_to be_valid
        expect(article_invalid.errors[:title]).to include("can't be blank")
        expect(article_invalid.errors[:content]).to include("can't be blank")
        expect(article_invalid.errors[:slug]).to include("can't be blank")
      end
    end

    it 'has not an unique slug' do
      # article1 = create(:article)
      # expect(article1).to be_valid
      # article_slug_invalid = build(:article, slug: article1.slug)
      expect(article_slug_invalid).not_to be_valid
      expect(article_slug_invalid.errors[:slug]).to include('has already been taken')
    end
  end

  describe '.recent' do # class method prefix .
    it 'returns articles in descending order' do
      article1 = create(:article, created_at: 1.hour.ago)
      article2 = create(:article)
      expect(described_class.recent).to eq([article2, article1])
      article2.update_column(:created_at, 2.hour.ago)
      expect(described_class.recent).to eq([article1, article2])
    end
  end
end
