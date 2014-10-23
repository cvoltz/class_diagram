Dir['tasks/*.rake'].each { |file| import file }

task :default => :spec

task :console do
  exec 'irb -r class_diagram -I ./lib'
end
