require "csv"
require "./lib/cleaner"
require "./lib/attendee"
require "pry"


class Reporter
  attr_reader :queue
  def initialize
     @cleaner = Cleaner.new
     @queue = []
  end

  def populate_queue(csv_path)
    contents = CSV.open csv_path, headers: true, header_converters: :symbol
    contents.each do |row|
      attendee = Attendee.new(row)
      @queue << attendee
    end
  end

  def find_first_names(name)
    @queue.each do |attendee|
      return attendee.first_name  if attendee.first_name == name
    end
    "Not found"
  end

end


# reporter = Reporter.new
# reporter.populate_queue("./data/attendee_fixture.csv")
# reporter.find_first_names
