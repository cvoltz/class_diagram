require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

# See http://aaron-jensen.com/post/5019042852/speed-up-your-rspec-cucumber-run and
# https://gist.github.com/aaronjensen/945912
namespace :spec do
  desc 'Run rspec in a fork from rake (which should be faster)'
  task :fork do
    fork do
      RSpec::Core::Runner.disable_autorun!
      RSpec::Core::Runner.run(['spec'], $stderr, $stdout) ? exit(0) : exit(1)
    end
    Process.wait
    raise 'rspec failed' unless $?.exitstatus == 0
  end
end
