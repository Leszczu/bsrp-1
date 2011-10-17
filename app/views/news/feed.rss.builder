xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "BS-RP.net | Bądź na bieżąco!"
    xml.description "Informacje z życia serwera Bayside Role Play."
    xml.link news_rss_url

    xml.image do
      xml.url   "http://localhost:3000/images/icons/max_feed.png"
      xml.title "Bayside Role Play"
      xml.link  "http://bs-rp.net/"
    end

    for news in @news
      xml.item do
        xml.title news.title
        xml.description news.intro
        xml.pubDate news.created_at.to_s(:rfc822)
        xml.link show_url(news.id, news.cached_slug)
        xml.guid show_url(news.id, news.cached_slug)
      end
    end
  end
end

