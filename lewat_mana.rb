require 'rubygems'
require 'open-uri'
require 'nokogiri'
require 'fileutils'

class LewatMana
  attr_accessor :url, :image_directory, :gif_directory, :name

  def initialize url, name = "MOI", image_folder = "data" , gif_folder = "timelapse"
    @url = url
    @name = name
    @image_directory = File.expand_path(File.dirname(__FILE__)) + "/" + image_folder
    @gif_directory = File.expand_path(File.dirname(__FILE__)) + "/" + gif_folder
    directory_exist?
  end

  def all_image
    @image_directory + "/*.jpg"    
  end

  def timelapse_directory
    @gif_directory + "/" + timelapse_name
  end

  def directory_exist?
    [@image_directory, @gif_directory].each do |directory|
      dirname = File.dirname(directory)
      unless File.directory?(directory)
        FileUtils.mkdir_p(directory)
      end
    end
  end

  def scrape
    doc = Nokogiri::HTML(open(@url))
    image_url = doc.css('#cam-img-209')[0]['src']
    file_name = Time.now.strftime("%d%m%y%H%M%S") + ".jpg"
    open("#{@image_directory}/#{file_name}", 'wb') do |file|
      file << open(image_url).read
    end
  end

  private
    def timelapse_name
      @name + Time.now.strftime("%d%m%y") + ".gif" 
    end

end
