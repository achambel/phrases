# encoding: utf-8
require 'net/http'
require 'mechanize'

def status_code(url)
  uri = URI(url)
  Net::HTTP.get_response(uri).code # Return a String
end

def success?(status_code)
  status_code.start_with?('2')
end

def phrasify(page)
  phrases = [] 
  if page.any?
    page.each do |p|
      phrases << p.text    
    end    
  end
  phrases
end

def request(url)
  @agent.get(url).search('p.fr')
end

@agent = Mechanize.new
url = 'http://pensador.uol.com.br/autor/osho/'

page = request(url)

puts phrasify(page)

#status = status_code('http://www.globo.com/')

#puts success?(status)
