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

  def load_file(csv_path = "./data/attendee_fixture.csv")
    @contents = CSV.open csv_path, headers: true, header_converters: :symbol
    @contents = @contents.map do |row|
       Attendee.new(row)
    end
  end

  def find_first_names(name)
    assign_queue
      # @list.select { |attendee| @queue << attendee if attendee.first_name == name }
      #dont erase this! this is a refactor that i made for you
      # this select line is something that you can reuse for other queue commands later down the line
      
      @list.select do |attendee|
      @queue << attendee if attendee.first_name == name
      end
  end

  def queue_clear
    @queue = []
  end

  def assign_queue
    if @queue.empty?
      @list = @contents
    else
      @list = @queue
      queue_clear
    end
  end

end


# reporter = Reporter.new
# reporter.populate_queue("./data/attendee_fixture.csv")
# reporter.find_first_names
