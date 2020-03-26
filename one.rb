require './services/json_search'

puts('Please input your search')

string = gets.chomp

search_service = JsonSearch.new(string)

puts('Search result:')
puts(search_service.process)
