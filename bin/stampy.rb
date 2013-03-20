require_relative File.join('..', 'lib', 'stampy')

interactor = Stampy::Interactor.new(ARGV[0])
puts interactor.calculate_and_humanize_input