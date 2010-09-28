require 'open-uri'

class NYTimes
  @@api_key   = NY_TIMES['api_key']
  @@base_url  = 'http://api.nytimes.com/svc/search/v1/article?'

  def self.search(date, query = 'economy', days_prior = 10)
    unless date.is_a?(String) and date.match /\d{4}-\d\d-\d\d/
      raise ArgumentError, 'The "date" argument must be a String in "YYYY-MM-DD" format.'
    end

    end_date    = Date.parse(date).strftime '%Y%m%d'
    begin_date  = (Date.parse(date) - 10.days).strftime '%Y%m%d'
    search_url  = "#{@@base_url}query=#{query}&begin_date=#{begin_date}&end_date=#{end_date}&api-key=#{@@api_key}"
    puts search_url
    request     = Net::HTTP.get_response URI.parse search_url
    json        = request.body
    data        = JSON.parse json
  end
end
