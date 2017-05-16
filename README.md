# LogProcessor
This is a ruby script for educational purpose only. I found a problem in the internet and solved. It took me an hour to complete this script in Ruby. It processes log files and display the report in expected format by the problem statement.

## Ideas extractable
One can easily extract the idea as following from this project:
- How to extract certain sub-strings following some specific patterns using ReGex in Ruby
- How to effectively use Data-Structure to keep track of aggregate values.
- How to start TDD in ruby
- Testing `STDOUT` in RSpec

## requirements

Ruby  > 2.0.0
```bash
sudo apt-get install ruby
```
or better if you install using `RVM` or `Rbenv`

RSpec >= 3.0 

```bash
gem install rspec
```
## How to use?
```bash
ruby process.rb example1.log example2.log example3.log
```

## How to run test?
```bash
rspec log_processor_test.rb -c
```

### System Sample Expected output
```bash
2016-12-12 warning:2 error: 1
2016-12-13 warning:0 error: 1
2016-12-14 warning:2 error: 1
2016-12-15 warning:1 error: 0
2016-12-16 warning:0 error: 1
```
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/shivabhusal/LogProcessor. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the Contributor Covenant code of conduct.

## License

The script is available as open source under the terms of the MIT License.
