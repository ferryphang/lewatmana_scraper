require 'clockwork'
require_relative 'scraper'
  
module Clockwork
  handler do |job|
    puts "Running #{job}"
  end

  every(1.minute, 'Scrape Lewatmana.com') {
    moi = LewatMana.new "http://lewatmana.com/cam/209/moi-kelapa-gading/", "/data"
    moi.scrape
  }

end