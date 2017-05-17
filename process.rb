require './lib/processor'

file_names_via_arg = ARGV;
file_names_via_arg.each do |filename|
 puts "In file: '#{filename}'"
 puts '*'*80
 lp =  LogProcessor.new(filename)
 lp.process
 puts '-'*80
end

