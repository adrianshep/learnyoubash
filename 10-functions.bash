# Learn Bash

## FUNCTIONS (Exercise 10 of 11)

 In scripts we have the ability to define and call functions. As in any
 programming language, functions in bash are chunks of code, but there are
 other differences.

 In bash, functions are a sequence of commands grouped under a single name,
 that is the name of the function. Calling a function is the same as
 calling any other program, you just write the name and the function will
 be invoked.

 We can declare our own function this way:

    my_func () {
      # statements
    }

    my_func # call my_func

 We must declare functions before we can invoke them.

 Functions can take on arguments and return a result — exit code.
 Arguments, within functions, are treated in the same manner as arguments
 given to the script in [non-interactive](#non-interactive-mode) mode —
 using [positional parameters](#positional-parameters). A result code can
 be returned using the return command.

 Below is a function that takes a name and returns 0, indicating successful
 execution.

    # function with params
    greeting () {
      if [[ -n $1 ]]; then
        echo "Hello, $1!"
      else
        echo "Hello, unknown!"
      fi
      return 0
    }

    greeting World  # Hello, World!
    greeting        # Hello, unknown!

 The return command without any arguments returns the exit code of the last
 executed command. Above, return 0 will return a successful exit code 0.

 We can also declare a variable local to a single function using the local
 keyword. Doing so causes the variable to disappear when the function
 exits.

    local local_var="I'm a local value"

## THE CHALLENGE

 Create a file named functions.bash.

 The problem is almost the same as in the previous exercise. You receive
 two positional parameters and should output all even numbers in the range
 between them. To do this, create a function with any name that will print
 these numbers using recursion. Also declare a function main that will
 print the value of $FUNCNAME and call your function.

 In other words, you should build a tree of even numbers. On the top of the
 tree should be the name of the main function. Other elements must be even
 numbers. Each new element of the tree should have indentation that is
 equal to depth (one level is one space  ).

 Example:

    ./loops.bash 10 17

 Output:

    main
     10
      12
       14
        16

 Use -n with echo to output something on the same line.

─────────────────────────────────────────────────────────────────────────────

  » To print these instructions again, run: learnyoubash print
  » To execute your program, run: learnyoubash run program.bash
  » To verify your program, run: learnyoubash verify program.bash
  » For help run: learnyoubash help
