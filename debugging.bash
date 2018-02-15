  Create a file named debugging.bash.

#  You will receive positional parameters. These positional parameters are
#  filenames in the format file[hash] (for example file177, file352). Your
#  script should do the following things:

#   1. Enable verbose and noexec options using set
#   2. Output all received parameters using echo
#   3. Create all these files
#   4. Create a directory with name folder in current directory
#   5. Move all files to the folder
#   6. Change directory to the folder
#   7. List all files inside the folder
#   8. Disable verbose and noexec options using set

#  Please, write one command per line without empty lines.

#  You must know how to move one or more files or directories from one place
#  to another. When we need to move files we use the mv command. The mv
#  command receives two arguments: the source and the destination. If both
#  filenames are on the same filesystem, this results in a simple file
#  rename. When a filename is moved to an existing filename, the existing
#  file is deleted.

#  For example:

#     mv old new           # renames 'old' to 'new'.
#     mv file subdir/file  # moves 'file' to 'subdir/file'
#     mv name* subdir/     # moves all matched to 'name*' files to the 'subdir'

#  Also, there is the cp command that copies one or more files or
#  directories. The usage of cp is the same as the mv command.

set -vn
echo $@
touch $@
mkdir ./folder
mv file* ./folder
cd ./folder
ls
set +vn
