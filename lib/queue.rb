require 'csv'
require './lib/cleaner'
require './lib/attendee'
require './lib/reader'

class Queue
    attr_reader :attendees,
                :queue

    def initialize
        @cleaner   = Cleaner.new
        @queue     = []
        @attendees = []
    end

    def queue_count
        @queue.length
    end

    def queue_clear
        @queue = []
    end

    def load_attendees(csv_path = "full_event_attendees.csv")
        @attendees = Reader.new(csv_path).content
        "You have successfully loaded #{csv_path}"
    end

    def find_first_name(name)
        queue_clear
        name = @cleaner.tidy_first_name(name)
        @attendees.select {|attendee| @queue << attendee if attendee.first_name == name }
    end

    def find_last_name(name)
        queue_clear
        name = @cleaner.tidy_last_name(name)
        @attendees.select {|attendee| @queue << attendee if attendee.last_name == name }
    end

    def find_city(city)
        queue_clear
        city = @cleaner.tidy_city(city)
        @attendees.select {|attendee| @queue << attendee if attendee.city == city }
    end

    def find_state(state)
        queue_clear
        state = @cleaner.tidy_state(state)
        @attendees.select {|attendee| @queue << attendee if attendee.state == state}
    end

    def queue_print(criteria = nil)
        if criteria == "by last_name"
            @queue.sort_by! { |attendee| attendee.last_name }
            format_print
        elsif criteria == "by first_name"
            @queue.sort_by! { |attendee| attendee.first_name }
            format_print
        else
            format_print
        end.join("\n")
    end

    def save_to(file_name)
        file = File.open(file_name, "w")
        format_csv
        formatted_csv = @queue.unshift("RegDate,first_Name,last_Name,Email_Address,HomePhone,Street,City,State,Zipcode")
        file.write(formatted_csv.join("\n"))
        file.close
        @queue.shift
    end

    def format_print
        @queue.map! do |attendee|
            "#{attendee.last_name},#{attendee.first_name},#{attendee.email_address},#{attendee.zipcode},#{attendee.city},#{attendee.state},#{attendee.street},#{attendee.homephone}"
        end
    end

    def format_csv
        @queue.map! do |attendee|
            "#{attendee.registration_date},#{attendee.first_name},#{attendee.last_name},#{attendee.email_address},#{attendee.homephone},#{attendee.street},#{attendee.city},#{attendee.state},#{attendee.zipcode}"
        end
    end

    def help(command = nil)
        command = command
        if command == "help load <filename>"
            @help = "Erases any previously loaded data and loads provided file. If no filename is given, <full_event_attendees.csv> will be loaded by default."
        elsif command == "help find"
            @help = "<find <attribute> <criteria>> : Populates the queue with all records matching the criteria for the given attribute."
        elsif command == "help queue count"
            @help = "Outputs how many records are in the current queue."
        elsif command == "help queue clear"
            @help = "Empty the queue."
        elsif command == "help queue print"
            @help = "Prints out current queue populated with current queue."
        elsif command == "help queue print by"
            @help = "<queue print by <attribute>> : Prints current queue data table sorted by the specified attribute like 'zipcode'."
        elsif command == "help queue save to"
            @help = "<queue save to <filename.csv>> : Export the current queue to the specified filename as a CSV."
        elsif command == "help queue export html"
            @help = "<queue export html <filename.csv>> : Export the current queue to the specified filename as a valid HTML file."
        else
            @help = "Available commands:\n<load <filename>>\n<find <attribute> <criteria>>\n<queue count>\n<queue clear>\n<queue print>\n<queue print by <attribute>>\n<queue save to <filename.csv>>\n<queue export html <filename.csv>>"
        end
    end
end
