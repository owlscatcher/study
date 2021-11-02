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
          film[COUNTRY].present? &&
            film[COUNTRY].include?(',') &&
            film[RATING].present? &&
            film[RATING].to_f > 0.0
        end

        numeric_rating = rating_array.map { |el| el[RATING].to_f }
        average_rating = numeric_rating.reduce(:+) / numeric_rating.size

        average_rating
      end

      def chars_count(films, threshold)
        films_in_threshold = films.select { |film| film[RATING].to_f >= threshold }
        symbols_in_titles = films_in_threshold.map { |film| film[NAME].count(SYMBOL) }
        summary = symbols_in_titles.reduce(:+)

        summary
      end
    end
  end
end
