def wait_for_exit
  Timeout::timeout(@aruba_timeout_seconds) do
    loop do
      break if assert_partial_output_interactive('Bye')
      sleep 0.1
    end
  end
end

# aruba reporting uses pygments to process the result files and it hardcodes
# a timeout of only 3 seconds so large files will cause it to throw an
# exception which cause the test to fail, so we have to remove large files
def rm_big_files(path)
  Dir["#{path}/**/*"].each do |file|
    FileUtils.rm file if File.size(file) > 1_000_000
  end
end

def assert_no_partial_output_line(unexpected, actual)
  actual.force_encoding(unexpected.encoding) if RUBY_VERSION >= "1.9"
  if Regexp === unexpected
    expect(unescape(actual) !~ unexpected)
  else
    expect(unescape(actual)).not_to include(unexpected)
  end
end

Then /^"([^"]*)" should contain "([^"]*)"$/ do |filename, content|
  check_file_presence([Regexp.new(filename)], true)
  check_file_content(path_of(filename), content, true)
end

Then /^"([^"]*)" should match \/([^"]*)\/$/ do |filename, pattern|
  check_file_presence([Regexp.new(filename)], true)
  check_file_content(path_of(filename), /#{pattern}/, true)
end

Then /^these files should exist:$/ do |files|
  check_file_presence(files.raw.map { |file| Regexp.new(file.first) }, true)
end

Then /^an output line should not contain \/(.+)\/$/ do |unexpected|
  assert_no_partial_output_line(unexpected, all_output)
end
