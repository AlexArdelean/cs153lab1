#include "param.h"
#include "types.h"
#include "stat.h"
#include "user.h"
#include "fs.h"
#include "fcntl.h"
#include "syscall.h"
#include "traps.h"
#include "memlayout.h"
//#include "defs.h"

int main(void)
{
	int* stat_ptr = 0;
	int status = 1;
	int pid = fork();
	int exit_pid = 0;

	if (pid == 0) //child
	{
		printf(1, "child pid = %d\n", getpid());
		exit_status(status);
	}

	else if (pid > 0)
	{
		exit_pid = wait_status(stat_ptr);
		printf(1, "exited child's pid = %d\n", exit_pid);
		int temp = *stat_ptr;
		printf(1, "exit status of child = %d\n", temp);
	}
	else
	{
	}
	exit();
}
