require 'csv'
require './lib/cleaner'
require './lib/attendee'

class Queue
    attr_reader :attendees,
                :queue

    def initialize
        @cleaner = Cleaner.new
        @queue = []
        @attendees = []
    end

    def queue_count
        @queue.length
    end

    def queue_clear
        @queue = []
    end

    def load_attendees(csv_path = "full_event_attendees.csv")
        file = CSV.open csv_path, headers: true, header_converters: :symbol
        file.each {|row| @attendees << Attendee.new(row)}
        "You have successfully loaded #{csv_path}"
    end

    def find_first_name(name)
        queue_clear
        @attendees.select {|attendee| @queue << attendee if attendee.first_name == name.capitalize }
    end

    def find_last_name(name)
        queue_clear
        @attendees.select {|attendee| @queue << attendee if attendee.last_name == name.capitalize }
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
            @help = "Available commands:\n<load <filename>>\n<find <attribute> <criteria>>\n<queue count>\n<queue clear>\n<queue print>\n<queue print by <attribute>>\n<queue save to <filename.csv>>\n<queue export html <filename.csv>>\n<queue clear>\n<queue clear>\n<queue clear>"
        end
    end
end
