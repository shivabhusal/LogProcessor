#! /usr/bin/ruby
# to run your code from CLI you need to use proper `shebang` like the line above

class LogProcessor
  attr_reader :log_file, :data

  # knives to cut out date and loglevel from line of string from log file
  DATE_REGEX = /\d{4}\-\d{1,2}\-\d{1,2}/ 
  LOG_LEVEL_REGEX =  /(?<=\[)\w+(?=\])/

  def initialize(file)
    @log_file = file
    @data = {} # will hold the data in format: {date: {warning: 0, error: 1}}
    @validity = true
  end
  
  def valid?
    @validity
  end

  def process
    parse()
    display()
  end

  private
  
  def parse
    File.open(log_file, 'r').each_line do |line|
      parse_line(line)  
      return false if @validity == false
    end
  end

  def parse_line(line)
    # using knives to cut/extract the data from string using RegEx like grep
    date = line[DATE_REGEX]
    log_level = line[LOG_LEVEL_REGEX]

    # replacing/initializing placeholders with valid value; instead of garbage or nil
    data[date] = {'warning' => 0, 'error' => 0} if data[date].nil?
    data[date][log_level] = 0                   if data[date][log_level].nil?

    # increasing the couters
    data[date][log_level] = data[date][log_level].nil? ? 1 :   data[date][log_level] + 1
    
    # no need to check further if the file is declared invalid
    @validity = false if date.nil? || log_level.nil?
  end

  def display
    data.each do |date, hash|
      puts "#{date} warning:#{hash['warning']} error:#{hash['error']}"
    end
  end
end
