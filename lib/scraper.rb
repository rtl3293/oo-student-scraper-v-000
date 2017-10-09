require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    html = open(index_url)
    doc = Nokogiri::HTML(html)
    students = doc.css(".student-card")
    student_info = students.collect do |student|
      {:name => student.css(".student-name").text,
      :location => student.css(".student-location").text,
    :profile_url => student.css("a")[0]['href']}
    end
    #
  end

  def self.scrape_profile_page(profile_url)
    html = open(profile_url)
    doc = Nokogiri::HTML(html)
    scraped_profile = {}
    doc.css(".social-icon-container a").each do |link|
      link_string = link['href']
      binding.pry
    end
    # scraped_profile = {:twitter => doc.css(".social-icon-container a")[0]['href'],
    # :linkedin => doc.css(".social-icon-container a")[1]['href'],
    # :github => doc.css(".social-icon-container a")[2]['href'],
    # :blog => doc.css(".social-icon-container a")[3]['href'],
    # :profile_quote => doc.css(".profile-quote").text,
    # :bio => doc.css(".bio-block p").text}
    #binding.pry
    scraped_profile
  end

end
