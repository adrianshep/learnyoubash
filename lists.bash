$1 || echo "First parameter is false."

$2 && pwd

$3 && ls || echo "Third parameter is false."


#  Using lists of commands (&, &&, || or ;) output First parameter is false.
#  if the first positional parameter is false, the path to the current
#  directory if the second parameter is true; if third parameter is true
#  output the list of files in the current directory or Third parameter is
#  false. if it is false.
