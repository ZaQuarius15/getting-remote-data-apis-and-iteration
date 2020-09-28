require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #final = []
  find_character_by_name(character_name)["films"].map do |film|
      JSON.parse(RestClient.get(film))
  end
  #final
end

def find_character_by_name(name)
  response_string = RestClient.get('http://swapi.dev/api/people')
  response_hash = JSON.parse(response_string)
  response_hash["results"].find do |character|
    character["name"] == name
  end
end

def print_movies(films)
  films.each do |film|
    puts film["title"]
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
