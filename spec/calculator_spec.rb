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

RSpec.describe Calculator do
  it "pushes an int to the stack" do
    c = Calculator.new

    result = c.push("5")

    expect(result).to eq(5)
  end

  it "pushes a float to the stack" do
    c = Calculator.new

    result = c.push("5.0")

    expect(result).to eq(5.0)
  end

  it "adds two numbers" do
    c = Calculator.new

    c.push("5")
    c.push("5")
    result = c.push("+")

    expect(result).to eq(10)
  end

  it "subtracts one number from another" do
    c = Calculator.new

    c.push("5")
    c.push("4")
    result = c.push("-")

    expect(result).to eq(1)
  end

  it "multiplies two numbers" do
    c = Calculator.new

    c.push("5")
    c.push("5")
    result = c.push("*")

    expect(result).to eq(25)
  end

  it "divides two numbers" do
    c = Calculator.new

    c.push("5")
    c.push("8")
    result = c.push("/")

    expect(result).to eq(0.625)
  end
end
