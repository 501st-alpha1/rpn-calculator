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

# Puts something only if attached to interactive TTY.
def putsi(text = nil)
  if $stdin.tty?
    puts text
  end
end

# Print something only if attached to interactive TTY.
def printi(text)
  if $stdin.tty?
    print text
  end
end

putsi "Starting RPN calculator..."
putsi "Enter one or more numbers or operators and press Enter."
putsi "To quit, type q or Ctrl-D."

calculator = Calculator.new

while true
  printi '> '
  input = gets

  # Handle EOF / Ctrl-D
  if input.nil?
    putsi
    putsi "Goodbye!"
    break
  end

  input = input.chomp

  if input == 'q'
    putsi "Goodbye!"
    break
  end

  if input == 'undo'
    begin
      result = calculator.undo
      puts "Removed last item (#{result}) from stack."
      next
    rescue IndexError => e
      puts "Error: #{e.message}"
    end
  end

  # Split input string by whitespace.
  args = input.split

  result = nil

  # Process each item of input array.
  args.each do |arg|
    result = nil
    begin
      result = calculator.push(arg)
    rescue *[IndexError, ArgumentError, ZeroDivisionError] => e
      puts "Error: #{e.message}"

      # If not interactive, abort on first error.
      if !$stdin.tty?
        break
      end
    end
  end

  if !result.nil?
    puts result
  end
end
