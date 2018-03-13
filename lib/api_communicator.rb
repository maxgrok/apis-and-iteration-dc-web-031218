require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)
  films = []
  films_data = []
  character_hash["results"].each do |key, value|
    if key["name"] == character
      films = key["films"].collect do |film|
        film
      end
    end
    films.each do |film|
      # binding.pry
        films_data << film
    end
    # binding.pry
    return films_data
  end
  # iterate over the character hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
end

def parse_character_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list
  film_titles = []
  films_hash.each do |curr_film|
    curr_film_parsed = RestClient.get(curr_film)
    films_parsed = JSON.parse(curr_film_parsed)
    films_parsed.each do |title, film_title|
      # binding.pry
      if title == "title"
        film_titles.push(film_title)
      end
    end
  end
  print film_titles.join(', ')
end

films_hash = get_character_movies_from_api("Luke Skywalker")
parse_character_movies(films_hash)

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end


## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
