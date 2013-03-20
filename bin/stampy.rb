require_relative File.join('..', 'lib', 'stampy')

interactor = Interactor.new(ARGV[0])
puts interactor.calculate_and_humanize_input