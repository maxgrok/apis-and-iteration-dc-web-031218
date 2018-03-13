require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)
<<<<<<< HEAD
  films = []
  films_data = {}
  character_hash["results"].each do |key, value|
    if key["name"] == character 
      films = key["films"].collect do |film| 
        film 
      end
    end
    films.each do |film|
        films_data = RestClient.get(film)
    end
    return films_data  
=======

  character_hash["results"].each do


>>>>>>> 46773057553a38ffcf792e7adcfbe04eaa3ae6d8
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
<<<<<<< HEAD
  films_hash.each do |key, value|
    if key == "url"
      movies = RestClient.get(value)
       movie = JSON.parse(movies)
        return movie["title"]
      end
    end
=======
  films_hash.each do |film|
    print film_hash["title"].join(", ")
  end

>>>>>>> 46773057553a38ffcf792e7adcfbe04eaa3ae6d8
end

parse_character_movies(get_character_movies_from_api("Luke Skywalker"))

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end

get_character_movies_from_api("Luke Skywalker")
## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
