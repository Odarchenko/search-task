require 'json'

# Json Search service
class JsonSearch
  REGEX_WORD_IN_QUOTES = /"([^"]*)"/.freeze # regex for search in ""
  FILTER_WORD_REGEX = /--(.*)/.freeze # regex for search filter keys --
  SEARCH_REGEX = '(?i)(?=.*?%s)'.freeze # regex for search query
  FILTER_REGEX = '^(?i)((?!%s).)*$'.freeze # regex for filter query

  attr_reader :data, :search_string

  def initialize(search_string)
    @search_string = search_string
    @data = JSON.load(File.open('./data/data.json'))
  end

  def process
    search
  end

  private

  # search from local data
  def search
    data.select { |raw| raw.values.join(',').match?(/#{search_query}/) }
  end

  # generate search regex
  def search_query
    @search_query ||= search_values.each_with_object("") { |search_value, query_string| query_string << SEARCH_REGEX % search_value } + filter_query
  end

  # generate filter regex
  def filter_query
    filter_values.each_with_object("") { |filter_value, query_string| query_string << FILTER_REGEX % filter_value  }
  end

  def search_values
    [search_values_without_quotes_and_filters, search_values_in_quotes].flatten
  end

  # get values in "" to separate search value
  def search_values_in_quotes
    search_string.scan(REGEX_WORD_IN_QUOTES)
  end

  # get rest values for all possible searches
  def search_values_without_quotes_and_filters
    search_string.gsub(Regexp.union(FILTER_WORD_REGEX, REGEX_WORD_IN_QUOTES), '').split(' ')
  end

  # get negative conditions
  def filter_values
    search_string.scan(FILTER_WORD_REGEX).flatten
  end
end
