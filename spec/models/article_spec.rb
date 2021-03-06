# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'valid' do
    it 'has a valid title' do
      article = build(:article, title: 'Test 1')
      expect(article).to be_valid
    end

    it 'has an invalid title' do
      article = build(:article, title: '')
      expect(article).to be_invalid
      expect(article.errors[:title]).to include("can't be blank")
    end

    it 'is valid and saved' do
      article = create(:article)
      expect(article).to be_valid
      expect(Article.count).to eq(1)
    end

    it 'slug is not uniq' do
      article = create(:article, slug: 'slug-1')
      expect(article).to be_valid

      article = build(:article, slug: 'slug-1')
      expect(article).to be_invalid
      expect(article.errors[:slug]).to include('has already been taken')
    end
  end

  describe '.recent' do
    it 'returns articles order by created_at DESC' do
      older_article = create(:article, created_at: 1.day.ago)
      new_article = create(:article)

      expect(described_class.all).to eq([older_article, new_article])
      expect(described_class.recent).to eq([new_article, older_article])
    end
  end
end
