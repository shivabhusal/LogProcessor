# LogProcessor
Process log files and display the report

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
