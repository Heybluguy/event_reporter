class Cleaner

      # def tidy_registration_date(registration_date)
      #   registration_date.to_s if registration_date
      # end

      def tidy_zipcode(zipcode)
        zipcode.to_s.rjust(5,"0")[0..4]
      end

      def tidy_first_name(first_name)
        first_name.split(" ").map {|name| name.capitalize }.join(" ")
      end

      def tidy_last_name(last_name)
        last_name.split(" ").map {|name| name.capitalize }.join(" ")
      end

      def tidy_city(city)
        city.split(" ").map {|city| city.capitalize }.join(" ") if city
      end

      def tidy_state(state)
        state.to_s.upcase
      end

      def tidy_phone_number(number)
        if !number.to_s.empty?
        [$1, $2, $3].join("-") if number.gsub(/\D/, "").match(/^1?(\d{3})(\d{3})(\d{4})/)
        end
      end
  end
