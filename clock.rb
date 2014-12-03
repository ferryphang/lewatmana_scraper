require 'clockwork'
require './scraper'
  
module Clockwork
  handler do |job|
    puts "Running #{job}"
  end

  # handler receives the time when job is prepared to run in the 2nd argument
  # handler do |job, time|
  #   puts "Running #{job}, at #{time}"
  # end

  every(2.minutes, 'Scrape Lewatmana.com') {
    moi = LewatMana.new "http://lewatmana.com/cam/209/moi-kelapa-gading/", "./data"
    moi.scrape
  }

end