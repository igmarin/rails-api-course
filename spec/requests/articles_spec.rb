# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ArticlesController do
  describe '#index' do
    it 'returns a success response' do
      get '/articles'
      expect(response).to have_http_status(:ok)
    end

    it 'returns a proper JSON' do
      article = create(:article)
      get '/articles'
      expect(json_data.size).to eq(1)
      subject = json_data.first
      expect(subject[:id]).to eq(article.id.to_s)
      expect(subject[:type]).to eq('article')
      expect(subject[:attributes]).to eq(
        title: article.title,
        slug: article.slug,
        content: article.content
      )
    end

    it 'returns articles in proper order' do
      older_article = create(:article, created_at: 1.day.ago)
      recent_article = create(:article)

      get '/articles'

      ids = json_data.map { |item| item[:id].to_i }
      expect(ids).to(
        eq([recent_article.id, older_article.id])
      )
    end

    it 'paginates results' do
      _, article2 = create_list(:article, 3)
      get '/articles', params: { page: { number: 2, size: 1 } }

      expect(json_data.size).to eq(1)
      expect(json_data.first[:id]).to eq(article2.id.to_s)
    end

    it 'contains pagination links in response' do
      create_list(:article, 3)
      get '/articles', params: { page: { number: 2, size: 1 } }

      expect(json[:links].length).to eq(5)
      expect(json[:links].keys).to contain_exactly(
        :first, :prev, :next, :last, :self
      )
    end
  end

  describe '#show' do
    let(:article) { create(:article) }

    it 'returns a success response' do
      get "/articles/#{article.id}"
      expect(response).to have_http_status(:ok)
    end
  end
end
