require 'rest-client'
require 'json'
require 'pry'


def character_hash
  all_characters = RestClient.get("http://www.swapi.co/api/people/")
  JSON.parse(all_characters)
end
# => entire hash
# puts character_hash


def get_character_movies_from_api(character)
  character_hash["results"].each do |characters|
    if characters["name"] == character
      characters["films"]
    end
    # => [urls]
    #make the web request
    films_info = [ ]
      characters["films"].each do |films_url|
      all_films = RestClient.get(films_url)
      films_info << JSON.parse(all_films)
    end
    # return films_info.is_a?(Array) # true
    return films_info
  end
end


# p get_character_movies_from_api("R2-D2")
#MAKE WEB request






def parse_character_movies(character)
  # some iteration magic and puts out the movies in a nice list

  film_info = get_character_movies_from_api(character).collect do |key, value| #each movie
    "Movie title:#{key["title"]} Producer(s): #{key["producer"]} Episode No.:#{key["episode_id"]}"
  end

   puts film_info[0...film_info.size]

end

p parse_character_movies("")


# .each do |key, value|
#
#      puts ["title"][value]
#       puts["episode_id"][value]
#       puts ["director"][value]
#       binding.pry
# end






# def parse_character_movies(films_hash)
#   # some iteration magic and puts out the movies in a nice list
# end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
