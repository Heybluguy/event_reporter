require "csv"
require "./lib/cleaner"
require "./lib/attendee"

class Reporter
  attr_reader :queue

  def initialize
     @cleaner = Cleaner.new
     @queue = []
     @attendees = []
  end

  def load_attendees(csv_path)
    contents = CSV.open csv_path, headers: true, header_converters: :symbol
    contents.each do |row|
      @attendees << Attendee.new(row)
    end
  end

  def find_first_name(name)
    queue_clear
    @attendees.select do |attendee|
      @queue << attendee if attendee.first_name.casecmp(name) == 0
    end
    make_names_pretty(@queue)
  end

  def find_city(city)
    queue_clear
    @attendees.select do |attendee|
      @queue << attendee if attendee.city.casecmp(city) == 0
    end
    # make_names_pretty(@queue)
    @queue
  end

  def make_names_pretty(queue)
    @queue.map do |attendee|
      attendee.first_name = attendee.first_name.capitalize
    end
  end

  def queue_clear
    @queue = []
  end

  def queue_count
    @queue.count
  end

  def help(commands = {})
    if commands == "queue count"
      "Output how many records are in the current queue"
    elsif commands == "queue print"
      "Print out a tab-delimited data table with a header row following this format:"
    else
      "load\nqueue\nqueue count\nqueue clear\nfind\nfind first_name\nfind last_name\nfind reg_date\nfind email_address\nfind homephone\nfind street\nfind city\nfind state\nfind zipcode\nqueue print\nqueue print by\nqueue save to\nquit\n"
    end
  end

  def queue_print(commands = {})
    @queue.map do |attendee|
      if commands == "by last_name"
        attendee.last_name
      else
        "#{attendee.registration_date}, #{attendee.first_name}, #{attendee.last_name}, #{attendee.email_address}, #{attendee.homephone}, #{attendee.street}, #{attendee.city}, #{attendee.state}, #{attendee.zipcode}"
      end
    end.join("\n")
  end

  def format_csv
    @queue.map! do |attendee|
        "#{attendee.last_name}, #{attendee.first_name}, #{attendee.email_address}, #{attendee.zipcode}, #{attendee.city}, #{attendee.state}, #{attendee.street}, #{attendee.homephone}"
    end
    @queue.unshift("LAST NAME  FIRST NAME  EMAIL  ZIPCODE  CITY  STATE  ADDRESS  PHONE").join("\n")
  end

  def queue_save(file_name)
    save_file = File.open(file_name, "w")
    save_file.write(format_csv)
    save_file.close
  end

end
