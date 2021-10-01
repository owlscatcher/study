module Exercise
  module Arrays
    class << self
      def replace(array)
        max_value = find_biggest(array)

        iter = lambda do |index|
          array[index] = max_value if array[index] >= 0
          return array if index == array.size - 1

          iter.call(index + 1)
        end

        iter.call(0)
      end

      def find_biggest(array)
        iter = lambda do |index, current_max|
          current_max = array[index] if array[index] > current_max
          return current_max if index == array.size - 1

          iter.call(index + 1, current_max)
        end
        iter.call(0, 0)
      end

      def search(array, query)
        iter = lambda do |min, max|
          return -1 unless min <= max

          mid = (min + max) / 2

          index = mid if query == array[mid]

          if query == array[mid]
            index = mid
          elsif query > array[mid]
            min = mid + 1
          else
            max = mid - 1
          end

          return index if query == array[mid]

          iter.call(min, max)
        end
        iter.call(0, array.size - 1)
      end
    end
  end
end
