module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      NAME = 'name'.freeze
      COUNTRY = 'country'.freeze
      RATING = 'rating_kinopoisk'.freeze
      SYMBOL = 'и'.freeze

      def rating(array)
        rating_array = array.select do |film|
          !film[COUNTRY].nil? &&
            film[COUNTRY].include?(',') &&
            !film[RATING].nil? &&
            film[RATING].to_f > 0.0
        end

        rating_array.map { |element| element[RATING].to_f }.reduce(:+) / rating_array.size
      end

      def chars_count(films, threshold)
        films.map { |element| element[RATING].to_f >= threshold ? element[NAME].count(SYMBOL) : 0 }.reduce(:+)
      end
    end
  end
end
