# Application Guidelines

Find the most efficient combination of 3¢ and 5¢ stamps required to make any postage of 8¢ or more. The script will accept input from the command line. Executed with a simple:

  ruby stampy.rb amount

Valid examples:

  ruby stampy.rb 8
  ruby stampy.rb 101

Output should be a simple puts. So given `ruby stampy.rb 11`, output should be:

  1 five cent stamp, 2 three cent stamps

Invalid input should raise an exception. Assume at least Ruby 1.9.3.

# Release Notes

stampy.rb has been placed in bin/

# Testing Instructions

  bundle
  rspec

# License

MIT
