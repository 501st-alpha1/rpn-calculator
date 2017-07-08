# rpn-calculator
A command-line Reverse Polish Notation (RPN) calculator, written as part of the On-Site interview process.

## Usage

For an interactive session, run `cli.rb` directly.

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
