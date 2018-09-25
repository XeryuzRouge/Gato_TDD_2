RSpec.configure do |config|
  config.before(:all) { silence_output }
  config.after(:all) { enable_output }
end

def silence_output
  @orig_stderr = $stderr
  @orig_stdout = $stdout

  # redirect stderr and stdout to /dev/null
  $stderr = File.new('./spec/stdout.txt', 'w')
  $stdout = File.new('./spec/stderr.txt', 'w')
end

# Replace stdout and stderr so anything else is output correctly.
def enable_output
  $stderr = @orig_stderr
  $stdout = @orig_stdout
  @orig_stderr = nil
  @orig_stdout = nil
end