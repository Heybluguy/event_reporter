require './lib/event_reporter'

event_reporter = EventReporter.new
@input = nil
puts "««« Event Reporter Initialized »»»"
until @input == "quit" do
  @input = event_reporter.get_input
  event_reporter.evaluate(@input)
end
puts "««« Sequence Terminated »»»"
