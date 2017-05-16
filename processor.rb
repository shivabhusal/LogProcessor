#! /usr/bin/ruby
# to run your code from CLI you need to use proper `shebang` like the line above

class LogProcessor
  attr_reader :log_file, :data
  DATE_REGEX = /\d{4}\-\d{1,2}\-\d{1,2}/
  LOG_LEVEL_REGEX =  /(?<=\[)\w+(?=\])/

  def initialize(file)
    @log_file = file
    @data = {} # format: {date: {warning: 0, error: 1}}
    @validity = true
  end
  
  def valid?
    @validity  # making sure it does not return `nil`
  end

  def process
    parse
    display
  end

  private

  
  def parse
    File.open(log_file, 'r').each_line do |line|
      parse_line(line)  
      return false if @validity == false
    end
  end

  def parse_line(line)
    date = line[DATE_REGEX]
    log_level = line[LOG_LEVEL_REGEX]

    data[date] = {'warning' => 0, 'error' => 0} if data[date].nil?
    data[date][log_level] = 0 if data[date][log_level].nil?

    data[date][log_level] = data[date][log_level].nil? ? 1 :   data[date][log_level] + 1

    @validity = false if date.nil? || log_level.nil?
  end

  def display
    data.each do |date, hash|
      puts "#{date} warning:#{hash['warning']} error:#{hash['error']}"
    end
  end
end
