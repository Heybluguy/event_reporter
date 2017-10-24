class Attendee
  attr_reader :registration_date,
              :first_name,
              :last_name,
              :email_address,
              :homephone,
              :street,
              :city,
              :state,
              :zipcode

  def initialize(info)
    @registration_date = info[:regdate]
    @first_name = info[:first_name].capitalize
    @last_name = info[:last_name].capitalize
    @email_address = info[:email_address]
    @homephone = info[:homephone]
    @street = info[:street]
    @city = info[:city].capitalize
    @state = info[:state].capitalize
    @zipcode = info[:zipcode]
  end
end
