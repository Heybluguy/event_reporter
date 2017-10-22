class Attendee
  attr_reader :registration_date
  def initialize(info)
    @registration_date = info[:RegDate]
  end

end
