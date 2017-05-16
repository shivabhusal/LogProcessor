require 'rspec'
require './processor.rb'

RSpec.describe LogProcessor do
  it 'should validate if the file is a valid log file' do
    `echo "this is an invalid log format" >> invalid.log`
    lp = LogProcessor.new('invalid.log')
    lp.process
    expect(lp.valid?).to eq(false)
    `rm invalid.log`
  end

  it 'should validate as true if file is a valid log' do
    `echo "2016-12-14 this is a log line 1 [warning]\n2016-12-15 this is a log line 2 [warning]" >> valid.log`
    lp = LogProcessor.new('valid.log')
    lp.process
    expect(lp.valid?).to eq(true)
    `rm valid.log`
  end


  it 'should parse the content of each line and store in a data structure' do
    `echo "2016-12-14 this is a log line 1 [warning]\n2016-12-14  line 2 [error]\n2016-12-14 thig line 3 [error]\n2016-12-15 og line 3 [error]" >> valid.log`
    lp = LogProcessor.new('valid.log')
    lp.process
    expect(lp.data).to eq({'2016-12-14' => {'warning' => 1, 'error' => 2}, '2016-12-15' => {'warning' => 0, 'error' => 1}})
    `rm valid.log`
  end

  it 'should render the expected output in STDOUT stream' do
    `echo "2016-12-14 this is a log line 1 [warning]" >> valid.log`
    lp = LogProcessor.new('valid.log')
    expect { lp.process}.to  output("2016-12-14 warning:1 error:0\n").to_stdout
    `rm valid.log`
  end
end
