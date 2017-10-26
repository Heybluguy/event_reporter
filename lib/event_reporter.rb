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
    puts @queue.queue_count if input == "queue count"
    puts @queue.load_attendees if input == "load"
    puts @queue.load_attendees(input.split(" ")[1]) if input.start_with?("load ")
    puts @queue.queue_print("by last_name") if input == "queue print by last_name"
    puts @queue.queue_print if input == "queue print"
    @queue.queue_clear if input == "queue clear"
    @queue.find_city(input[9..-1 ]) if input.start_with?("find city ")
    @queue.save_to(input.split(" ")[-1]) if input.start_with?("queue save to ")
    @queue.find_first_name(input.split(" ")[2..-1].join(" ")) if input.start_with?("find first_name ")
    @queue.find_last_name(input.split(" ")[2..-1].join(" ")) if input.start_with?("find last_name ")
    @queue.find_state(input.split(" ")[-1]) if input.start_with?("find state ")
  end
end
