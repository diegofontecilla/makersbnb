require 'date'

class DateParser
  def self.parse(string)
    string
      .split(",")
      .map { |date_string| date_string.strip }
      .map { |stripped_date| handle_range(stripped_date) }
      .flatten
      .map { |stripped_date| Date.parse(stripped_date) }
      .sort
  end

  def self.to_str(array_of_dates)
    return_string = ""
    array_of_dates.each { |date_obj|
      return_string += "#{date_obj.strftime('%Y%m%d')}," }
      return_string[0..-2]
      # discard last comma
  end

  private

  def self.populate_range(date_range)
    start_date = Date.parse(date_range.sort.first)
    end_date = Date.parse(date_range.sort.last)
    populated_range = []
    counter = end_date
    while counter >= start_date do
      populated_range.push counter
      counter -= 1
    end
    populated_range.map { |date| date.strftime("%Y%m%d") }
  end

  def self.handle_range(stripped_date)
    date_range = stripped_date.split("-").map { |e| e.strip }
    return date_range if date_range.length == 1
    populate_range(date_range)
  end
end
