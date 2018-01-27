## THE CHALLENGE

#   Create a file named if.bash.

#   Using if statements and primaries, output Good morning! if the first
#   positional parameter is less than 12. Output Good afternoon! if it is
#   equal to/greater than 12 but less than 18. Otherwise, output Good evening!
#   if it is equal to/greater than 18. Take care about cases when the
#   positional argument is less than 0 and greater than 24 (print Error! in
#   these cases).

#   For example:

#      ./if.bash -5
#      ./if.bash 12
#      ./if.bash 21

#   Output:

#      Error!
#      Good afternoon!
#      Good evening!

if [[ $1 -lt 0 ] -o [ $1 -gt 24 ]]; then
  echo "Error!"
elif [ $1 -lt 12 ]; then
  echo "Good morning!"
elif [[ $1 -ge 12 ] -a [$1 -lt 18]]; then
  echo "Good afternoon!"
else
  echo "Good evening!"
fi
