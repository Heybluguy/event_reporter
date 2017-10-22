require "csv"
class Reader
  attr_reader :content
  def initialize
    @content = parse_csv(file_path)
  end

  def read_file(file_path)
    CSV.open file, headers: true, header_converters: :symbol
  end

  def parse_csv(file_path)

  end
end
