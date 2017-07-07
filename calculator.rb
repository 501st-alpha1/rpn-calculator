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

require './extensions.rb'

class Calculator
  def initialize
    @stack = []
  end

  def undo
    if @stack.length < 1
      raise IndexError.new("nothing else to undo")
    end

    return @stack.pop
  end

  def push(arg)
    if arg.is_number?
      if arg.is_float?
        arg = arg.to_f
      else
        arg = arg.to_i
      end

      @stack.push(arg)

      return arg
    elsif ['+', '-', '*', '/'].include?(arg)
      if @stack.length < 2
        message = "operator applied when stack has " + @stack.length.to_s \
                  + " item(s)."
        raise IndexError.new(message)
      end

      if @stack.last == 0 && arg == '/'
        raise ZeroDivisionError.new("cannot divide by zero.")
      end

      right = @stack.pop.to_f
      left = @stack.pop.to_f

      # See https://stackoverflow.com/a/20019672/2747593
      result = left.method(arg).(right)

      # Cast back to int if possible.
      if result.to_i.to_f == result
        result = result.to_i
      end

      return self.push(result)
    else
      message = "input must be number or operator. Input was: " + arg
      raise ArgumentError.new(message)
    end
  end
end
