require 'cucumber'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:features) do |t|
  t.fork = false
end
task(:features).comment = 'Run acceptance tests'

namespace :features do
  Cucumber::Rake::Task.new(:unused) do |t|
    t.cucumber_opts = '--dry-run -f Unused'
  end
  task(:unused).comment = 'Show unused Cucumber steps'
end
