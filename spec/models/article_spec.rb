# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'Valid Article' do
    it 'Article with title should be valid' do
      article = build(:article, title: 'Test 1')
      expect(article).to be_valid
    end

    it 'Expect article to have slug, title and context' do
      article = create(:article)
      expect(article).to be_valid
      expect(Article.count).to eq(1)
    end

    it 'Article without title should be invalid' do
      article = build(:article, title: nil)
      expect(article).to be_invalid
    end
  end
end
