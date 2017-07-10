# rpn-calculator
A command-line Reverse Polish Notation (RPN) calculator, written as part of the On-Site interview process.

[![Build Status](https://travis-ci.org/501st-alpha1/rpn-calculator.svg?branch=master)](https://travis-ci.org/501st-alpha1/rpn-calculator)

[![Coverage Status](https://coveralls.io/repos/github/501st-alpha1/rpn-calculator/badge.svg?branch=master)](https://coveralls.io/github/501st-alpha1/rpn-calculator?branch=master)

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

## Tests

Automatic tests use RSpec, and so can be run with:

```
rspec
```

To run in the Docker container, do:

```
docker run -t rpn-calculator rspec
```
