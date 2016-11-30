require 'rest-client'
require 'json'
require 'pry'


def character_hash
  all_characters = RestClient.get("http://www.swapi.co/api/people/")
  hash = JSON.parse(all_characters)
end
#=> all characters hash


def get_character_movies_from_api(character)
  chosen_one = character_hash["results"].find do |characters|
   characters["name"].downcase == character
  end
  # => single character hash
  #make the web request
  chosen_one["films"].sort.collect do |films_url|
    all_films = RestClient.get(films_url)
    JSON.parse(all_films)
  end
end


def parse_character_movies(character)
  # some iteration magic and puts out the movies in a nice list
  film_info = get_character_movies_from_api(character).collect do |key, value| #each movie
    "Movie title:#{key["title"]} Producer(s): #{key["producer"]} Episode No.:#{key["episode_id"]}"
  end
    puts film_info #[0...film_info.size]
end


def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?

# we did it :)


# def get_character_movies_from_api(character)
#   hash = {}
#   character_hash["results"].each do |stats|
#      if stats["name"].downcase == character
#        hash = stats
#        binding.pry
#       end
#
#     end
