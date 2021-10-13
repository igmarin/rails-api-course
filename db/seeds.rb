50.times do
  Article.create(title: FFaker::CheesyLingo.title,
                 content: FFaker::CheesyLingo.paragraph,
                 slug: FFaker::InternetSE.slug)
end
