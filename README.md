LEWATMANA.com
===============
MOI CCTV Scraping that scrape the traffic image and wrap it into a gif.
so it will looks like a timelapse.
Dependency
```sh
$ gem install clockwork
$ gem install nokogiri
$ brew install imagemagick
```
To Run on terminal
```sh
$ clockwork clock.rb
```
To Run on background (Make sure you install daemon gem)
```sh
$ gem install daemon
$ clockworkd -c clock.rb start
```