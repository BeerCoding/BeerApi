require "open-uri"

namespace :systembolaget do
  task :index => :environment do
    url = "http://www.systembolaget.se/api/assortment/products/xml"
    page = Nokogiri::XML(open(url).read)
    page.css("artiklar artikel").each do |a|
      group = a.css("Varugrupp").text
      if group.start_with?("Öl")
        hash = {}
        hash[:name] = a.css("Namn").text.strip
        hash[:article_id] = a.css("nr").text.strip
        hash[:provider] = "Systembolaget"
        hash[:country] = a.css("Ursprunglandnamn").text.strip
        hash[:alcohol] = a.css("Alkoholhalt").text.strip
        hash[:ecological] = a.css("Ekologisk").text.strip.to_i == 0
        hash[:koscher] = a.css("Koscher").text.strip.to_i == 0
        Beer.find_or_create_by(hash)
      end
    end

  end

  task :crawl => :environment do
    Beer.where("provider = ? AND article_id IS NOT ?", 'Systembolaget', nil).each do |beer|
      url = "http://www.systembolaget.se/dryck/ol/#{beer.name.parameterize}-#{beer.article_id}"
      p url
      begin
        page = Nokogiri::HTML(open(url).read)
        container = page.css("div.product-details div.symbols div.scroll-container ul")
        if container
          icons = container.css("li i.icon")
          if icons.size > 0
            hash = {}
            hash[:bitter] = icons[0]["class"].split(" ").last.split("-").last.to_i
            hash[:body] = icons[1]["class"].split(" ").last.split("-").last.to_i
            hash[:sweet] = icons[2]["class"].split(" ").last.split("-").last.to_i
            beer.update(hash)
          end
        end
        sleep(1)
      rescue => error
        puts error.inspect
      end

    end

  end
end
