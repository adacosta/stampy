$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require File.join('stampy', 'strategies', 'fives_and_threes_strategy')
require File.join('stampy', 'presenters', 'stamp_presenter')