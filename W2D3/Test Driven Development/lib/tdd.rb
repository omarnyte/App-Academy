 require 'byebug'

class Array

  def my_uniq
    uniqs = []
    self.each do |el|
      uniqs << el unless uniqs.include?(el)
    end
    uniqs
  end

  def two_sum
    pairs = []

    self.each_with_index do |el, i|
      break if i == self.length - 1

      j = i +1
      while j < self.length
        pairs << [i, j] if self[i] + self[j] == 0
        j += 1
      end
    end
    pairs.empty? ? nil : pairs
  end

  def my_transpose
    # byebug
    col = []
    self.length.times do
      col << []
    end
    self.each_with_index do |row, i|
      row.each_with_index do |el, j|
        col[j] << el
      end


    end
    col
  end

  def stock_picker
    days = %w(Monday Tuesday Wednesday Thursday Friday)
    byebug
    days_array = []

    self.each_with_index do |day, i|
      self.each_with_index do |next_day, j|
        break if i == days.length - 1
        j += 1
        days_array << [i, j] if day < next_day && i < j
      end
    end

    days_array.each do |pair|
    end

    return days_array
  end

end
