


reporter = Reporter.new
reporter.load_attendees("./data/full_event_attendees (1).csv")
reporter.find_city("Salt Lake City")
reporter.queue_save("city_sample.csv")
