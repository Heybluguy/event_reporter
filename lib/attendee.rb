class Attendee
  attr_accessor :registration_date,
                :first_name,
                :last_name,
                :email_address,
                :homephone,
                :street,
                :city,
                :state,
                :zipcode

  def initialize(info)
    make_it_pretty     = Cleaner.new
    @registration_date = info[:regdate]
    @first_name        = make_it_pretty.tidy_first_name(info[:first_name])
    @last_name         = make_it_pretty.tidy_last_name(info[:last_name])
    @email_address     = info[:email_address]
    @homephone         = make_it_pretty.tidy_phone_number(info[:homephone])
    @street            = info[:street]
    @city              = make_it_pretty.tidy_city(info[:city])
    @state             = make_it_pretty.tidy_state(info[:state])
    @zipcode           = make_it_pretty.tidy_zipcode(info[:zipcode])
  end
end
