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
      @registration_date = info[:regdate]
      @first_name        = info[:first_name].to_s.capitalize
      @last_name         = info[:last_name]
      @email_address     = info[:email_address]
      @homephone         = info[:homephone]
      @street            = info[:street]
      @city              = info[:city].to_s
      @state             = info[:state]
      @zipcode           = info[:zipcode]
    end
end
