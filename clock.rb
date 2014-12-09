require 'clockwork'
require_relative 'lewat_mana'
  
module Clockwork
  handler do |job|
    puts "Running #{job}"
  end

  every(1.minute, 'Scrape MOI Kelapa Gading CCTV') {
    moi = LewatMana.new "http://lewatmana.com/cam/209/moi-kelapa-gading/", "/data"
    moi.scrape
  }

  every(5.minutes, 'Build GIF') {
    project_dir = File.expand_path(File.dirname(__FILE__))
    system("convert #{project_dir + '/data/*.jpg' } #{project_dir + '/timelapse/MOI.gif'}")
  }

end