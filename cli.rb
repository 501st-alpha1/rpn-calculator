#!/usr/bin/env ruby
# A Reverse Polish Notation (RPN) calculator for On-Site assignment.
# Copyright (C) 2017 Scott Weldon
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

require './calculator.rb'

puts "Starting RPN calculator..."
puts "Enter one or more numbers or operators and press Enter."
puts "To quit, type q or Ctrl-D."

calculator = Calculator.new

while true
  print '> '
  input = gets

  # Handle EOF / Ctrl-D
  if input.nil?
    puts
    puts "Goodbye!"
    break
  end

  input = input.chomp

  if input == 'q'
    puts "Goodbye!"
    break
  end

  # Split input string by whitespace.
  args = input.split

  result = nil

  args.each do |arg|
    begin
      result = calculator.push(arg)
    rescue ZeroDivisionError => e
      puts "Error, cannot divide by zero."
    end
  end

  if !result.nil?
    puts result
  end
end
