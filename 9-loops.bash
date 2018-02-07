# Learn Bash

## LOOPS (Exercise 9 of 11)

 Here we won't be surprised. As in any programming language, a loop in bash
 is a block of code that iterates as long as the control conditional is
 true.

 There are four types of loops in Bash: for, while, until and select.

### for loop

 The for loop is very similar to its sibling in C. It looks like this:

    for arg in elem1 elem2 ... elemN
    do
      # statements
    done

 During each pass through the loop, arg takes on the value from elem1 to
 elemN. Values may also be wildcards or [brace
 expansion](#brace-expansion).

 Also, we can write a for loop in one line, but in this case there needs to
 be a semicolon before do, like below:

    for i in {1..5}; do echo $i; done

 By the way, if for..in..do seems a little bit weird to you, you can also
 write for in C-like style such as:

    for (( i = 0; i < 10; i++ )); do
      echo $i
    done

 for is handy when we want to do the same operation over each file in a
 directory. For example, if we need to move all .bash files into the script
 folder and then give them execute permissions, our script would look like
 this:

    #!/bin/bash

    for FILE in $HOME/*.bash; do
      mv "$FILE" "${HOME}/scripts"
      chmod +x "${HOME}/scripts/${FILE}"
    done

### while loop

 The while loop tests a condition and loops a sequence of commands so long
 as that condition is true. A condition is nothing more than the primary
 used in if..then conditions. So a working example with while loop might
 look like this:

    #!/bin/bash

    # Squares of numbers from 0 through 9
    x=0
    while [[ $x -lt 10 ]]; do # value of x is less than 10
      echo $(($x * $x))
      x=`expr $x + 1` # increase x
    done

 Just like in the case of the for loop, if we want to write do and the
 condition in the same line, then we must use a semicolon before do.

### until loop

 The until loop is the exact opposite of the while loop. Like a while loop
 it checks a test condition, but it keeps looping as long as this condition
 is false:

    until [[ condition ]]; do
      #statements
    done

### Loop control

 There are situations when we need to stop a loop before its normal ending
 or step over an iteration. In these cases, we can use the shell built-in
 break and continue statements. Both of these work with every kind of loop.

 The break statement is used to exit the current loop before its ending.

 The continue statement steps over one iteration. We can use it as such:

    for (( i = 0; i < 10; i++ )); do
      if [[ $(($i % 2)) == 0 ]]; then continue; fi
      echo $i
    done

 If we run the example above, it will print all odd numbers from 0 through
 9.

## THE CHALLENGE

 Create a file named loops.bash.

 The first two positional parameters which will be passed into your script
 are the limits. You should write all even numbers in the range between the
 first and second positional parameters.

 Example:

    ./loops.bash 10 17

 Output:

    10
    12
    14
    16

 Use for, while or until loops to solve this problem.

─────────────────────────────────────────────────────────────────────────────

  » To print these instructions again, run: learnyoubash print
  » To execute your program, run: learnyoubash run program.bash
  » To verify your program, run: learnyoubash verify program.bash
  » For help run: learnyoubash help


  Here's the official solution in case you want to compare notes:

 ─────────────────────────────────────────────────────────────────────────────

     #!/usr/bin/env bash

     i=$1
     while [[ $i -lt $2 ]]; do
       [ ! $(( $i % 2 )) -eq 0 ] || echo $i
       i=$(( $i + 1 ))
     done

 ─────────────────────────────────────────────────────────────────────────────

     incorrect solution:
     
     # for i in {$1..$2}; do
     #  if [[ $(($i % 2)) == 0 ]]; echo $i; then continue; fi
     # done


 # Done!

  In the description of the problem we haven't mentioned the select loop.

  The select loop helps us to organize a user menu. It has almost the same
  syntax as a for loop:

     select answer in elem1 elem2 ... elemN
     do
       # statements
     done

  The select prints all elem1..elemN on the screen with their sequence
  numbers, after that it prompts the user. Usually it looks like $? (PS3
  variable). The answer will save in answer. If answer is the number between
  1..N, then statements will execute and select will go to the next
  iteration — that's because we should use break statement.

  A working example might look like this:

     #!/bin/bash

     PS3="Choose the package manager: "
     select ITEM in bower npm gem pip
     do
       echo -n "Enter the package name: " && read PACKAGE
       case $ITEM in
         bower) bower install $PACKAGE ;;
         npm)   npm   install $PACKAGE ;;
         gem)   gem   install $PACKAGE ;;
         pip)   pip   install $PACKAGE ;;
       esac
       break # avoid infinite loop
     done

  This example, asks the user what package manager to use. Then, it will ask
  what package we want to install and finally proceed to install it.

  If we run this, we will get:

     $ ./my_script
     1) bower
     2) npm
     3) gem
     4) pip
     Choose the package manager: 2
     Enter the package name: bash-handbook
     <installing bash-handbook>
