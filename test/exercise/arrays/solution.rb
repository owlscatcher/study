module Exercise
  module Arrays
    class << self
      def replace(array)
        max_value = find_biggest(array)
        array.map { |element| element >= 0 ? max_value : element }
      end

      def find_biggest(array)
        max = array[0]
        array.each { |element| max = element if element > max }
        max
      end

      def search(array, query)
        binary_search(array, query, 0, array.size - 1)
      end

      def binary_search(array, query, min, max)
        return -1 unless min <= max

        mid = (min + max) / 2
        if query == array[mid]
          mid
        elsif query > array[mid]
          binary_search(array, query, mid + 1, max)
        else
          binary_search(array, query, min, mid - 1)
        end
      end
    end
  end
end
