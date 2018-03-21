require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  characters_hash = JSON.parse(all_characters)

  films = []
  films_data = []
<<<<<<< HEAD
  characters_hash["results"].each do |key, value|
    if key["name"] == character 
      films = key["films"].collect do |film| 
        film 
      end
    end
    films.each do |film| 
        films_data.push(film)
    end
=======
  character_hash["results"].each do |key, value| #try to refactor without each
    if key["name"] == character
      films = key["films"].collect do |film|
        film
      end
    end
    films.each do |film| #use collect or map instead of each
      # binding.pry
        films_data << film
    end
    # binding.pry
>>>>>>> 5ee27c264438f3396fe9a7d9fdb87b875e2137dc
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

def parse_character_movies(films_array)
  # some iteration magic and puts out the movies in a nice list
<<<<<<< HEAD
  titles =[]
  films_array.each do |current_film|
    current_film_parse = RestClient.get(current_film)
    films_parsed = JSON.parse(current_film_parse)
    films_parsed.each do |key, value|
    if key == "title"
      titles.push(value)
    end
  end
end
    print titles.join(", ")
=======
  film_titles = []
  films_hash.each do |curr_film|
    curr_film_parsed = RestClient.get(curr_film)
    films_parsed = JSON.parse(curr_film_parsed)
    films_parsed.each do |title, film_title| #use select instead of each with an if statement
      # binding.pry
      if title == "title"
        film_titles.push(film_title)
      end
    end
  end
  print film_titles.join(', ')
>>>>>>> 5ee27c264438f3396fe9a7d9fdb87b875e2137dc
end

films_array = get_character_movies_from_api("Luke Skywalker")
parse_character_movies(films_array)

def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  parse_character_movies(films_array)
end

def get_titles_urls
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  characters_hash = JSON.parse(all_characters)

  titles =[]
  characters_hash["results"].each do |key, value|
    if key == "title"
      key.each do |name|
        titles.push(name)
      end
    end
    puts titles
  end
end

get_titles_urls


## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
