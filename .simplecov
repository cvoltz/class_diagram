require 'simplecov-rcov'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  SimpleCov::Formatter::RcovFormatter,
]

SimpleCov.start do
  add_filter    '/.bundle/'
  add_filter    '/.rvm/'
  add_filter    '/config/'
  add_filter    '/features/'
  add_filter    '/puppet/'
  add_filter    '/spec/'
  add_filter    '/test/'
  add_filter    '/tmp/'
  add_filter    '/vendor/'
  root          File.expand_path(File.dirname(__FILE__))
  coverage_dir  [ENV['BUILD_ARTIFACTS'] || 'tmp/build', 'coverage'].join('/')
  merge_timeout 3600
end
