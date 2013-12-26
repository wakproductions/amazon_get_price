require 'rubygems'
require 'capybara'
require 'capybara/dsl'
require 'capybara/poltergeist'

Capybara.default_driver = :poltergeist
Capybara.run_server = false

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, phantomjs_options: ['--load-images=false', '--disk-cache=false'])
end

module GetPrice
  class WebScraper
    include Capybara::DSL

    def get_amazon_page(url)
      visit(url)
      doc = Nokogiri::HTML(page.html)

      product_name = doc.css('#title').text.strip
      price = doc.css('#priceblock_ourprice').text
      sr = doc.css('#SalesRank').text
      sr =~ /(#\d+)/ ? sales_rank = /(#\d+)/.match(sr)[0] : sales_rank = nil

      {
          product_name: product_name,
          price: price,
          sales_rank: sales_rank
      }
    end
  end
end


puts "Enter the ASIN for the product you want to look up."
puts "Examples: B00CMHWTRQ or B0063I7OO8"
print "ASIN: "
asin = STDIN.gets.chomp

url = "http://www.amazon.com/dp/#{asin}"
puts "Downloading #{url}"

scraper = GetPrice::WebScraper.new
puts scraper.get_amazon_page(url)



