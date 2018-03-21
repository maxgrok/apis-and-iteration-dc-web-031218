require 'rest-client'
require 'json'
require 'pry'


def parse_character_movies_bonus(films_hash)
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


def show_character_movies_bonus(character)
  films_hash = get_character_movies_from_api_bonus(character)
  parse_character_movies_bonus(films_hash)
end


def get_character_attributes_from_api_bonus(character, attribute)
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)

  all_attributes = get_all_attributes(character)

  final_attribute = all_attributes[0]["#{attribute}"]
  final_attribute
  return final_attribute
end



def get_all_attributes(character)
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)

  all_attributes = character_hash["results"].select do |attribute_list|
    attribute_list["name"] == character
  end

  return all_attributes
end

# get_character_attributes_from_api_bonus("Luke Skywalker", "films")
parse_character_movies_bonus(get_character_attributes_from_api_bonus("Luke Skywalker", "films"))











## BONUS

# that `get_character_movies_from_api_bonus` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?













# def get_character_movies_from_api_bonus(character)
#   #make the web request
#   all_characters = RestClient.get('http://www.swapi.co/api/people/')
#   character_hash = JSON.parse(all_characters)
#   films = []
#   films_data = []
#
# #   character_hash["results"].each do |key, value| #what could we use instead of each
# #     if key["name"] == character
# #       films = key["films"].collect do |film|
# #         film
# #       end
# #     end
# #     films.each do |film| #use a map instead of each
# #       # binding.pry
# #         films_data << film
# #     end
# #     # binding.pry
# #     return films_data
# #   end
# #
# #
# #
# #   # iterate over the character hash to find the collection of `films` for the given
# #   #   `character`
# #   # collect those film API urls, make a web request to each URL to get the info
# #   #  for that film
# #   # return value of this method should be collection of info about each film.
# #   #  i.e. an array of hashes in which each hash reps a given film
# #   # this collection will be the argument given to `parse_character_movies_bonus`
# #   #  and that method will do some nice presentation stuff: puts out a list
# #   #  of movies by title. play around with puts out other info about a given film.
# # end


# films_hash = get_character_movies_from_api_bonus("Luke Skywalker")
# parse_character_movies_bonus(films_hash)
