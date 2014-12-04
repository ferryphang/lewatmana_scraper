require 'rubygems'
require 'nokogiri'
require 'open-uri'

class LewatMana
  attr_accessor :url, :directory

  def initialize url, directory
    @url = url
    @directory = File.expand_path(File.dirname(__FILE__)) + directory
  end

  def path
    
  end

  def scrape
    doc = Nokogiri::HTML(open(@url))
    image_url = doc.css('#cam-img-209')[0]['src']
    file_name = Time.now.strftime("%d%m%y%H%M%S") + ".jpg"
    open("#{@directory}/#{file_name}", 'wb') do |file|
      file << open(image_url).read
    end
  end
end

