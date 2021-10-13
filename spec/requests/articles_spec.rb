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
      body = JSON.parse(response.body).deep_symbolize_keys

      expect(body).to eq(
        data: [
          {
            id: article.id.to_s,
            type: 'article',
            attributes: {
              title: article.title,
              slug: article.slug,
              content: article.content
            }
          }
        ]
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
