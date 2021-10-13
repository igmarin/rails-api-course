# frozen_string_literal: true

FactoryBot.define do
  factory :article do
    title { FFaker::CheesyLingo.title }
    content { FFaker::CheesyLingo.paragraph }
    slug { FFaker::InternetSE.slug }
  end
end
