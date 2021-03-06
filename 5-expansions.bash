# Learn Bash

 ## SHELL EXPANSIONS (Exercise 5 of 11)

  Expansions  are a mechanism to calculate arithmetical operations, to save
  results of command's executions and so on.

  If you are interested, you can read [more about shell
  expansions](https://www.gnu.org/software/bash/manual/bash.html#Shell-Expan
  sions).

 ### Brace expansion

  Brace expansions allow us to generate arbitrary strings. It's similar to
  filename expansion. For example:

     echo beg{i,a,u}n # begin began begun

  Also brace expansions may be used for creating ranges, which are iterated
  over in loops.

     echo {0..5} # 0 1 2 3 4 5
     echo {00..8..2} # 00 02 04 06 08

 ### Command substitution

  Command substitution allow us to evaluate a command and substitute its
  value into another command or variable assignment. Command substitution is
  performed when a command is enclosed by  ``  or $().  For example, we can
  use it as follows:

     now=`date +%T`
     # or
     now=$(date +%T)

     echo $now # 19:08:26

 ### Arithmetic expansion

  In bash we are free to do any arithmetic operations. But the expression
  must be enclosed by $(( )). The format for arithmetic expansions is:

     result=$(( ((10 + 5*3) - 7) / 2 ))
     echo $result # 9

 ## THE CHALLENGE

  Create a file named expansions.bash.

  Your script should multiply the first positional parameter with the sum of
  the second and third parameter using arithmetic expansion. Save the result
  to the variable, $RESULT e.g.

  Then, using brace expansions, restore the following folder structure:

     project-<RESULT>
     ├── dest
     │   ├── index.js
     │   └── util.js
     ├── src
     │   ├── index.js
     │   └── util.js
     └── test
         ├── index.js
         └── util.js

  Do not create any folders! Just output the result using echo. For example:

     ./expansions.bash 1 5 6

  The result must looks like this:

     project-11/src/index.js project-11/src/util.js project-11/dest/index.js project-11/dest/util.js project-11/test/index.js project-11/test/util.js

 ─────────────────────────────────────────────────────────────────────────────

   » To print these instructions again, run: learnyoubash print
   » To execute your program, run: learnyoubash run program.bash
   » To verify your program, run: learnyoubash verify program.bash
   » For help run: learnyoubash help

   Here's the official solution in case you want to compare notes:

─────────────────────────────────────────────────────────────────────────────

   #!/usr/bin/env bash

   R=$(( ($3 + $2) * $1))
   echo project-$R/{src,dest,test}/{index,util}.js

─────────────────────────────────────────────────────────────────────────────

   #!/usr/bin/env bash

   R=$(( ($3 + $2) * $1))
   echo project-$R/{src,dest,test}/{index,util}.js


# Nice job!

You just output the folder structure, but actually you can easily create
this tree in the same way. Say hello to the mkdir and touch commands.

The mkdir command create an empty folder with a given name. The touch
command make an empty file with a given name.

So now, knowing about these commands, we can do something like this:

   mkdir -p project/{src,dest,test}/
   touch project/{src,dest,test}/{index,util}.js

Above we use the -p flag with the mkdir command to make parent directories
as needed.

To see the content of the folder use the ls command.

Run man to get to know more about the mkdir, touch and ls commands.
