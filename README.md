# rpn-calculator
A command-line Reverse Polish Notation (RPN) calculator, written as part of the On-Site interview process.

[![Build Status](https://travis-ci.org/501st-alpha1/rpn-calculator.svg?branch=master)](https://travis-ci.org/501st-alpha1/rpn-calculator)

[![Coverage Status](https://coveralls.io/repos/github/501st-alpha1/rpn-calculator/badge.svg?branch=master)](https://coveralls.io/github/501st-alpha1/rpn-calculator?branch=master)

To calculate an RPN expression (such as `1 1 +`), each input item is examined.  If the item is a number, it is pushed to the stack.  If the item is an operator, then the correct number of items (here always 2) are popped from the stack, the operator is applied to those items, and the result is pushed to the stack.

The main logic is in the [Calculator](./calculator.rb) class.  The primary method is `push`, used both to push a new item onto the stack and to calculate any result.  Results are calculated immediately, because deferring the calculations would add unnecessary overhead and complexity.  A stack (technically a Ruby array, which includes stack functionality) is used because RPN only needs access to the top of the stack.

## Usage

If you have Ruby installed locally, you can run `cli.rb` directly.

By default, an interactive session will be started:

```
$ ./cli.rb
Starting RPN calculator...
Enter one or more numbers or operators and press Enter.
To quit, type q or Ctrl-D.
> 1
1
> 1
1
> +
2
> q
Goodbye!
```

You can also pipe the input data to stdin:

```
$ echo "1 1 +" | ./cli.rb
2
```

If you don't have Ruby installed locally, you can use the provided Docker image instead.  First, build the image:

```
docker build -t rpn-calculator .
```

Or pull a pre-built version from Docker Hub:

```
docker pull 501stalpha1/rpn-calculator
```

An interactive session may be started as:

```
$ docker run -it rpn-calculator
Starting RPN calculator...
Enter one or more numbers or operators and press Enter.
To quit, type q or Ctrl-D.
> 1
1
> 1
1
> +
2
> q
Goodbye!
```

To pipe in the input data, drop the `-t` argument from the `docker run` command:

```
$ echo "1 1 +" | docker run -i rpn-calculator
2
```

## Development

To update the Ruby gems via. a Docker container, do:

```
docker run --rm -v "$PWD":/usr/src/app -w /usr/src/app ruby:2.4 bundle update
```

## Tests

Automatic tests use RSpec, and so can be run with:

```
rspec
```

To run in the Docker container, do:

```
docker run -t rpn-calculator rspec
```

## License

As indicated in the file headers, this project is licensed under the GNU GPL, see [the LICENSE file](./LICENSE) for details.
