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

# Adapted from https://stackoverflow.com/a/16456749/2747593
class Object
  def is_float?
    return self.to_f.to_s == self.to_s
  end

  def is_int?
    return self.to_i.to_s == self.to_s
  end

  def is_number?
    return self.is_float? || self.is_int?
  end
end
