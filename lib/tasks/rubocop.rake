require 'rubocop/rake_task'

Rubocop::RakeTask.new do |task|
  task.patterns = [ 'app/**/*.rb' ]
  task.fail_on_error = false
end
