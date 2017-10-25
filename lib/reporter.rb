require_relative 'queue'

class Reporter
  def initialize
    @queue = Queue.new
    @user_input = nil
  end

  def sequence
    puts "Welcome "
    until @user_input == "quit" do
      get_input
      compare_input(@user_input)
    end
  end

  def start_commands(input)
    case input[0]
    when "load" then load_csv(input[1])
    when "find" then find_people(input[1], input[2])
    when "queue" then queue_commands(input[1], input[2], input[3])
    when "help" then helper_commands(input[1], input[2], input[3])
    when "quit" then exit
    end
  end

  def queue_commands(output, action, attribute)
    @list = List.new
    @reporter = EventReporter.new
    if output == "clear"
      puts @list.clear_queue
    elsif output == "count"
      puts @list.queue.count
    elsif output == "print"
      puts @print.printing_queue
    elsif output == "print" && action == "by" && "#{attribute}"
      puts @print.printing_queue
    elsif output == "save" && action == "to" && "./data/#{attribute}"
      puts @reporter.write_list
    elsif output == "export" && action == "html" && "./data/#{attribute}"
      puts @reporter.write_html
    end
  end


  #
  # def compare_input(input)
  #   exit if input == "quit"
  #   if input.start_with?("load ")
  #     puts "You loaded file #{input.split(" ").last}!"
  #     @queue.load_attendees(input.split(" ").last)
  #   elsif input.start_with?("find last_name ")
  #     @queue.find_last_name(input.split(" ").last)
  #   elsif input == "queue print by last_name"
  #     @queue.queue_print("by last_name")
  #   end
  # end

  def get_input
    @user_input = gets.chomp
  end
end
