require 'open-uri'

class Parser < Struct.new(:url)

  def parse
    doc = Nokogiri::HTML(open(url))

    return {
      h1: doc.css('h1').map(&:text),
      h2: doc.css('h2').map(&:text),
      h3: doc.css('h3').map(&:text),
      urls: doc.css('a').map{ |l| l['href']},
    }
  end
end