# Learn Bash

 ## STREAMS PIPES AND LISTS (Exercise 6 of 11)

  This exercise is very important because streams, pipes, and lists of
  commands are used everywhere. You will meet these strange > and |
  characters in almost any script. So let's discover the secret to what they
  exactly are.

 ### Streams

  Bash receives input and sends output as sequences or streams of
  characters. These streams may be redirected into files or vice versa.

  There are three descriptors:

 Code Descriptor Description
 ---- ---------- --------------------
   0     stdin   The standard input.
   1    stdout   The standard output.
   2    stderr   The errors output.

  Redirection makes it possible to control where the output of a command
  goes to, and where the input of a command comes from. For redirecting
  streams these operators are used:

 Operator Description
 -------- --------------------------------------------------------------------
     >    Redirecting output
    &>    Redirecting output and error output
    &>>   Appending redirected output and error output
     <    Redirecting input
    <<    [Here documents](http://tldp.org/LDP/abs/html/here-docs.html) syntax
    <<<   [Here strings](http://www.tldp.org/LDP/abs/html/x17837.html)

  Here are a few examples of using redirections:

     # output of ls will be written to list.txt
     ls -l > list.txt

     # append output to list.txt
     ls -a >> list.txt

     # all errors will be written to errors.txt
     grep da * 2> errors.txt

     # read from errors.txt
     less < errors.txt

 ### Pipes

  We could redirect standard streams not only in files, but also to other
  programs. Pipes let us use the output of a program as the input of
  another.

  In the example below, command1 sends its output to command2, which then
  passes it on to the input of command3:

     command1 | command2 | command3

  Constructions like this are called pipelines.

  In practice, this can be used to process data through several programs.
  For example, here the output of ls -l is sent to the grep program, which
  prints only files with a .md extension, and this output is finally sent to
  the less program:

     ls -l | grep .md$ | less

 ### Lists of commands

  A list of commands is a sequence of one or more pipelines separated by ;,
  &, && or || operator.

  If a command is terminated by the control operator &, the shell executes
  the command asynchronously in a subshell. In other words, this command
  will be executing in the background.

  Commands separated by a ; are executed sequentially: one after another.
  The shell waits for the finish of each command.

     # command2 will be executed after command1
     command1 ; command2

     # which is the same as
     command1
     command2

  Lists separated by && and || are called AND and OR lists, respectively.

  The AND-list looks like this:

     # command2 will be executed if, and only if, command1 finishes successfully (returns 0 exit status)
     command1 && command2

  The OR-list has the form:

     # command2 will be executed if, and only if, command finishes unsuccessfully (returns code of error)
     command1 || command2

  The return code of AND and OR lists the exit status of the last executed
  command.

 ## THE CHALLENGE

  Create a file named lists.bash.

  Using lists of commands (&, &&, || or ;) output First parameter is false.
  if the first positional parameter is false, the path to the current
  directory if the second parameter is true; if third parameter is true
  output the list of files in the current directory or Third parameter is
  false. if it is false.

  For example:

     ./lists.bash true true false

  Output:

     ~/Projects/bash-exercices.
     Third parameter is false.

 ─────────────────────────────────────────────────────────────────────────────

   » To print these instructions again, run: learnyoubash print
   » To execute your program, run: learnyoubash run program.bash
   » To verify your program, run: learnyoubash verify program.bash
   » For help run: learnyoubash help

   Here's the official solution in case you want to compare notes:

  ─────────────────────────────────────────────────────────────────────────────

      #!/usr/bin/env bash

      $1 || echo "First parameter is false."

      $2 && pwd

      $3 && ls || echo "Third parameter is false."

  ─────────────────────────────────────────────────────────────────────────────

      #!/usr/bin/env bash

      $1 || echo "First parameter is false."

      $2 && pwd

      $3 && ls || echo "Third parameter is false."


  # Great!

   Streams and pipes are useful to create logs and to transfer data from one
   command to another. Lists of commands give you the opportunity to change
   the result of the execution of your script.

   You are already familiar with the ls command. But what if you need to list
   all files with a specific extension in the current directory?

   Meet the grep command! The grep command prints lines matching a pattern.
   Now, using grep we can solve the problem like so:

      ls | grep .md$

   The pipeline above will print only files with .md extension.

   Learn more about grep using man grep.
