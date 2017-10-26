require_relative 'queue'

class EventReporter
    attr_accessor :input

    def initialize
        @queue = Queue.new
        @input = nil
    end

    def get_input
        @input = gets.chomp
    end

    def evaluate(input)
        puts @queue.help if input == "help"
        puts @queue.help(input) if input.start_with?("help ")
    end
end
