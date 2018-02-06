## THE CHALLENGE

#   Create a file named loops.bash.

#   The first two positional parameters which will be passed into your script
#   are the limits. You should write all even numbers in the range between the
#   first and second positional parameters.

#   Example:

#      ./loops.bash 10 17

#   Output:

#      10
#      12
#      14
#      16

#   Use for, while or until loops to solve this problem.

# for i in {$1..$2}; do
#  if [[ $(($i % 2)) == 0 ]]; echo $i; then continue; fi
# done

i=$1
while [[ $i -lt $2 ]]; do
  [ ! $(( $i % 2 )) -eq 0 ] || echo $i
  i=$(( $i + 1 ))
done
