require 'clockwork'
require_relative 'lewat_mana'
  
module Clockwork
  handler do |job|
    puts "Running #{job}"
  end
  
  moi = LewatMana.new "http://lewatmana.com/cam/209/moi-kelapa-gading/", "MOI", "data", "timelapse"
  
  every(1.minute, 'Scrape MOI Kelapa Gading CCTV') { 
    moi.scrape
  }

  every(5.minutes, 'Build GIF') {
    system("convert #{moi.all_image} #{moi.timelapse_directory}")
  }

end