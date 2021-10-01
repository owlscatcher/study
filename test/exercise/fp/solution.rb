module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        country = 'country'
        rating = 'rating_kinopoisk'
        rating_array = array.reject { |film| film[country].nil? }.select { |film| film[country].include?(',') }.reject { |film| film[rating].nil? }.map { |film| film[rating].to_f }.select { |value| value > 0.0 }

        iter = lambda do |index, acc|
          return (acc / rating_array.size) if index > rating_array.size - 1

          iter.call(index + 1, acc + rating_array[index])
        end
        iter.call(0, 0.0)
      end

      def chars_count(films, threshold)
        rating = 'rating_kinopoisk'
        name = 'name'

        filtered_array = films.reject { |film| film[rating].nil? }.select { |film| film[rating].to_f >= threshold }

        iter = lambda do |index, acc|
          return acc if index > filtered_array.size - 1

          iter.call(index + 1, acc + filtered_array[index][name].count('и'))
        end
        iter.call(0, 0)
      end
    end
  end
end
