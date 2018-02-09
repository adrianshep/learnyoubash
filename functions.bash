#  The problem is almost the same as in the previous exercise. You receive
#  two positional parameters and should output all even numbers in the range
#  between them. To do this, create a function with any name that will print
#  these numbers using recursion. Also declare a function main that will
#  print the value of $FUNCNAME and call your function.

#  In other words, you should build a tree of even numbers. On the top of the
#  tree should be the name of the main function. Other elements must be even
#  numbers. Each new element of the tree should have indentation that is
#  equal to depth (one level is one space  ).

#  Example:

#     ./loops.bash 10 17

#  Output:

#     main
#      10
#       12
#        14
#         16

#  Use -n with echo to output something on the same line.

# function with params
greeting () {
  if [[ -n $1 ]]; then
    echo "Hello, $1!"
  else
    echo "Hello, unknown!"
  fi
  return 0
}
