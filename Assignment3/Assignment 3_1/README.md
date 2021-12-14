# Question 1

To apply the necessary changes apply the patch file `patch.patch` on your kernel. After that use `test.c` to check it. For the nice value part use the `nicevalues.c` file to run nicevalue.sh which will first print all processes and then filter them by your nice value of choice.

You can run both of them together using make command followed by `./nicevalues` to run the `nicevalues.c` file and also `./test` to run the `test.c` file

## Methodology for Patch:

- Added an extra delay parameter inside `sched_entity` in `sched.h`

- Initialized it in `core.c`

- Added this delay to `vruntime` in `fair.c`

- Finally created a syscall in `sys.c`

- Added this syscall to the syscall table `syscall_64.tbl`

## Process to Generate diff - 

- Create 2 fresh extracts of tar file
- Overwrite `sched.h`, `core.c`, `sys.c`, `fair.c` and `syscall_64.tbl` in one of them
- Use `git diff --no-prefix path1 path2 >> patch.patch` to save it in a patch file

## For Nice Value Part - 

- The C program executes nicevalue.sh via execl
- nicevalue.sh retrieves all ongoing processes using `ps ax -o pid,ni,cmd,etime,bsdstart`
- It also filter the processes based on the nice value inputted by the user
