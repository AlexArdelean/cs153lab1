
_wait_more:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fcntl.h"
#include "syscall.h"
#include "traps.h"
#include "memlayout.h"

int main(int argc, char ** argv){
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 30             	sub    $0x30,%esp

    int pid = fork();
   9:	e8 5e 04 00 00       	call   46c <fork>
   e:	89 44 24 2c          	mov    %eax,0x2c(%esp)
    int i;
    int status;
    if(pid > 0){
  12:	83 7c 24 2c 00       	cmpl   $0x0,0x2c(%esp)
  17:	0f 8e 77 01 00 00    	jle    194 <main+0x194>
        for(i = 0; i < 15 && pid > 0; i++){
  1d:	c7 44 24 28 00 00 00 	movl   $0x0,0x28(%esp)
  24:	00 
  25:	eb 29                	jmp    50 <main+0x50>
            pid = fork();
  27:	e8 40 04 00 00       	call   46c <fork>
  2c:	89 44 24 2c          	mov    %eax,0x2c(%esp)
            if(pid < 0)
  30:	83 7c 24 2c 00       	cmpl   $0x0,0x2c(%esp)
  35:	79 14                	jns    4b <main+0x4b>
                printf(1,"errors occur!\n");
  37:	c7 44 24 04 e8 09 00 	movl   $0x9e8,0x4(%esp)
  3e:	00 
  3f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  46:	e8 ca 05 00 00       	call   615 <printf>

    int pid = fork();
    int i;
    int status;
    if(pid > 0){
        for(i = 0; i < 15 && pid > 0; i++){
  4b:	83 44 24 28 01       	addl   $0x1,0x28(%esp)
  50:	83 7c 24 28 0e       	cmpl   $0xe,0x28(%esp)
  55:	7f 07                	jg     5e <main+0x5e>
  57:	83 7c 24 2c 00       	cmpl   $0x0,0x2c(%esp)
  5c:	7f c9                	jg     27 <main+0x27>
            pid = fork();
            if(pid < 0)
                printf(1,"errors occur!\n");
        }
        if (pid == 0){
  5e:	83 7c 24 2c 00       	cmpl   $0x0,0x2c(%esp)
  63:	0f 85 59 01 00 00    	jne    1c2 <main+0x1c2>
            int j = 0;
  69:	c7 44 24 24 00 00 00 	movl   $0x0,0x24(%esp)
  70:	00 
            while(j++ < 1000);
  71:	90                   	nop
  72:	8b 44 24 24          	mov    0x24(%esp),%eax
  76:	8d 50 01             	lea    0x1(%eax),%edx
  79:	89 54 24 24          	mov    %edx,0x24(%esp)
  7d:	3d e7 03 00 00       	cmp    $0x3e7,%eax
  82:	7e ee                	jle    72 <main+0x72>
            if(getpid() == 5) sleep(50);
  84:	e8 6b 04 00 00       	call   4f4 <getpid>
  89:	83 f8 05             	cmp    $0x5,%eax
  8c:	75 0c                	jne    9a <main+0x9a>
  8e:	c7 04 24 32 00 00 00 	movl   $0x32,(%esp)
  95:	e8 6a 04 00 00       	call   504 <sleep>
            
            printf(1,"pid = %d\n",getpid());
  9a:	e8 55 04 00 00       	call   4f4 <getpid>
  9f:	89 44 24 08          	mov    %eax,0x8(%esp)
  a3:	c7 44 24 04 f7 09 00 	movl   $0x9f7,0x4(%esp)
  aa:	00 
  ab:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  b2:	e8 5e 05 00 00       	call   615 <printf>
            if(getpid() == 10){
  b7:	e8 38 04 00 00       	call   4f4 <getpid>
  bc:	83 f8 0a             	cmp    $0xa,%eax
  bf:	75 58                	jne    119 <main+0x119>
                printf(1,"pid 10 waiting for 5\n");
  c1:	c7 44 24 04 01 0a 00 	movl   $0xa01,0x4(%esp)
  c8:	00 
  c9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  d0:	e8 40 05 00 00       	call   615 <printf>
                int wpid = waitpid(5,&status,0);
  d5:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  dc:	00 
  dd:	8d 44 24 10          	lea    0x10(%esp),%eax
  e1:	89 44 24 04          	mov    %eax,0x4(%esp)
  e5:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
  ec:	e8 33 04 00 00       	call   524 <waitpid>
  f1:	89 44 24 18          	mov    %eax,0x18(%esp)
                printf(1,"success clean %d, exit status is%d\n",wpid,status);
  f5:	8b 44 24 10          	mov    0x10(%esp),%eax
  f9:	89 44 24 0c          	mov    %eax,0xc(%esp)
  fd:	8b 44 24 18          	mov    0x18(%esp),%eax
 101:	89 44 24 08          	mov    %eax,0x8(%esp)
 105:	c7 44 24 04 18 0a 00 	movl   $0xa18,0x4(%esp)
 10c:	00 
 10d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 114:	e8 fc 04 00 00       	call   615 <printf>
            }
            if(getpid() == 12){
 119:	e8 d6 03 00 00       	call   4f4 <getpid>
 11e:	83 f8 0c             	cmp    $0xc,%eax
 121:	75 4f                	jne    172 <main+0x172>
                printf(1,"pid 12 waiting for 5\n");
 123:	c7 44 24 04 3c 0a 00 	movl   $0xa3c,0x4(%esp)
 12a:	00 
 12b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 132:	e8 de 04 00 00       	call   615 <printf>
                int wpid = waitpid(5,&status,0);
 137:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 13e:	00 
 13f:	8d 44 24 10          	lea    0x10(%esp),%eax
 143:	89 44 24 04          	mov    %eax,0x4(%esp)
 147:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 14e:	e8 d1 03 00 00       	call   524 <waitpid>
 153:	89 44 24 14          	mov    %eax,0x14(%esp)
                if(wpid == -1)
 157:	83 7c 24 14 ff       	cmpl   $0xffffffff,0x14(%esp)
 15c:	75 14                	jne    172 <main+0x172>
                    printf(1,"no more waiting for 5\n");
 15e:	c7 44 24 04 52 0a 00 	movl   $0xa52,0x4(%esp)
 165:	00 
 166:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 16d:	e8 a3 04 00 00       	call   615 <printf>
            }
            if(getpid() == 5)
 172:	e8 7d 03 00 00       	call   4f4 <getpid>
 177:	83 f8 05             	cmp    $0x5,%eax
 17a:	75 0c                	jne    188 <main+0x188>
                exit_status(5);
 17c:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 183:	e8 8c 03 00 00       	call   514 <exit_status>
            exit_status(0);
 188:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 18f:	e8 80 03 00 00       	call   514 <exit_status>
        }
    }else if(pid == 0){
 194:	83 7c 24 2c 00       	cmpl   $0x0,0x2c(%esp)
 199:	75 27                	jne    1c2 <main+0x1c2>
        int j = 0;
 19b:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
 1a2:	00 
        while(j++ < 1000);
 1a3:	90                   	nop
 1a4:	8b 44 24 20          	mov    0x20(%esp),%eax
 1a8:	8d 50 01             	lea    0x1(%eax),%edx
 1ab:	89 54 24 20          	mov    %edx,0x20(%esp)
 1af:	3d e7 03 00 00       	cmp    $0x3e7,%eax
 1b4:	7e ee                	jle    1a4 <main+0x1a4>
        exit_status(0);
 1b6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1bd:	e8 52 03 00 00       	call   514 <exit_status>
    }
    int going = 1;
 1c2:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
 1c9:	00 
    while(going >= 0){
 1ca:	eb 2c                	jmp    1f8 <main+0x1f8>
        going = wait_status(&status);
 1cc:	8d 44 24 10          	lea    0x10(%esp),%eax
 1d0:	89 04 24             	mov    %eax,(%esp)
 1d3:	e8 44 03 00 00       	call   51c <wait_status>
 1d8:	89 44 24 1c          	mov    %eax,0x1c(%esp)
        printf(1,"kill %d process\n",going);
 1dc:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 1e0:	89 44 24 08          	mov    %eax,0x8(%esp)
 1e4:	c7 44 24 04 69 0a 00 	movl   $0xa69,0x4(%esp)
 1eb:	00 
 1ec:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1f3:	e8 1d 04 00 00       	call   615 <printf>
        int j = 0;
        while(j++ < 1000);
        exit_status(0);
    }
    int going = 1;
    while(going >= 0){
 1f8:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
 1fd:	79 cd                	jns    1cc <main+0x1cc>
        going = wait_status(&status);
        printf(1,"kill %d process\n",going);
    };
    exit_status(0);
 1ff:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 206:	e8 09 03 00 00       	call   514 <exit_status>
 20b:	90                   	nop

0000020c <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 20c:	55                   	push   %ebp
 20d:	89 e5                	mov    %esp,%ebp
 20f:	57                   	push   %edi
 210:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 211:	8b 4d 08             	mov    0x8(%ebp),%ecx
 214:	8b 55 10             	mov    0x10(%ebp),%edx
 217:	8b 45 0c             	mov    0xc(%ebp),%eax
 21a:	89 cb                	mov    %ecx,%ebx
 21c:	89 df                	mov    %ebx,%edi
 21e:	89 d1                	mov    %edx,%ecx
 220:	fc                   	cld    
 221:	f3 aa                	rep stos %al,%es:(%edi)
 223:	89 ca                	mov    %ecx,%edx
 225:	89 fb                	mov    %edi,%ebx
 227:	89 5d 08             	mov    %ebx,0x8(%ebp)
 22a:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 22d:	5b                   	pop    %ebx
 22e:	5f                   	pop    %edi
 22f:	5d                   	pop    %ebp
 230:	c3                   	ret    

00000231 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 231:	55                   	push   %ebp
 232:	89 e5                	mov    %esp,%ebp
 234:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 237:	8b 45 08             	mov    0x8(%ebp),%eax
 23a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 23d:	90                   	nop
 23e:	8b 45 08             	mov    0x8(%ebp),%eax
 241:	8d 50 01             	lea    0x1(%eax),%edx
 244:	89 55 08             	mov    %edx,0x8(%ebp)
 247:	8b 55 0c             	mov    0xc(%ebp),%edx
 24a:	8d 4a 01             	lea    0x1(%edx),%ecx
 24d:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 250:	0f b6 12             	movzbl (%edx),%edx
 253:	88 10                	mov    %dl,(%eax)
 255:	0f b6 00             	movzbl (%eax),%eax
 258:	84 c0                	test   %al,%al
 25a:	75 e2                	jne    23e <strcpy+0xd>
    ;
  return os;
 25c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 25f:	c9                   	leave  
 260:	c3                   	ret    

00000261 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 261:	55                   	push   %ebp
 262:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 264:	eb 08                	jmp    26e <strcmp+0xd>
    p++, q++;
 266:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 26a:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 26e:	8b 45 08             	mov    0x8(%ebp),%eax
 271:	0f b6 00             	movzbl (%eax),%eax
 274:	84 c0                	test   %al,%al
 276:	74 10                	je     288 <strcmp+0x27>
 278:	8b 45 08             	mov    0x8(%ebp),%eax
 27b:	0f b6 10             	movzbl (%eax),%edx
 27e:	8b 45 0c             	mov    0xc(%ebp),%eax
 281:	0f b6 00             	movzbl (%eax),%eax
 284:	38 c2                	cmp    %al,%dl
 286:	74 de                	je     266 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 288:	8b 45 08             	mov    0x8(%ebp),%eax
 28b:	0f b6 00             	movzbl (%eax),%eax
 28e:	0f b6 d0             	movzbl %al,%edx
 291:	8b 45 0c             	mov    0xc(%ebp),%eax
 294:	0f b6 00             	movzbl (%eax),%eax
 297:	0f b6 c0             	movzbl %al,%eax
 29a:	29 c2                	sub    %eax,%edx
 29c:	89 d0                	mov    %edx,%eax
}
 29e:	5d                   	pop    %ebp
 29f:	c3                   	ret    

000002a0 <strlen>:

uint
strlen(char *s)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 2a6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 2ad:	eb 04                	jmp    2b3 <strlen+0x13>
 2af:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 2b3:	8b 55 fc             	mov    -0x4(%ebp),%edx
 2b6:	8b 45 08             	mov    0x8(%ebp),%eax
 2b9:	01 d0                	add    %edx,%eax
 2bb:	0f b6 00             	movzbl (%eax),%eax
 2be:	84 c0                	test   %al,%al
 2c0:	75 ed                	jne    2af <strlen+0xf>
    ;
  return n;
 2c2:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 2c5:	c9                   	leave  
 2c6:	c3                   	ret    

000002c7 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2c7:	55                   	push   %ebp
 2c8:	89 e5                	mov    %esp,%ebp
 2ca:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 2cd:	8b 45 10             	mov    0x10(%ebp),%eax
 2d0:	89 44 24 08          	mov    %eax,0x8(%esp)
 2d4:	8b 45 0c             	mov    0xc(%ebp),%eax
 2d7:	89 44 24 04          	mov    %eax,0x4(%esp)
 2db:	8b 45 08             	mov    0x8(%ebp),%eax
 2de:	89 04 24             	mov    %eax,(%esp)
 2e1:	e8 26 ff ff ff       	call   20c <stosb>
  return dst;
 2e6:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2e9:	c9                   	leave  
 2ea:	c3                   	ret    

000002eb <strchr>:

char*
strchr(const char *s, char c)
{
 2eb:	55                   	push   %ebp
 2ec:	89 e5                	mov    %esp,%ebp
 2ee:	83 ec 04             	sub    $0x4,%esp
 2f1:	8b 45 0c             	mov    0xc(%ebp),%eax
 2f4:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 2f7:	eb 14                	jmp    30d <strchr+0x22>
    if(*s == c)
 2f9:	8b 45 08             	mov    0x8(%ebp),%eax
 2fc:	0f b6 00             	movzbl (%eax),%eax
 2ff:	3a 45 fc             	cmp    -0x4(%ebp),%al
 302:	75 05                	jne    309 <strchr+0x1e>
      return (char*)s;
 304:	8b 45 08             	mov    0x8(%ebp),%eax
 307:	eb 13                	jmp    31c <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 309:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 30d:	8b 45 08             	mov    0x8(%ebp),%eax
 310:	0f b6 00             	movzbl (%eax),%eax
 313:	84 c0                	test   %al,%al
 315:	75 e2                	jne    2f9 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 317:	b8 00 00 00 00       	mov    $0x0,%eax
}
 31c:	c9                   	leave  
 31d:	c3                   	ret    

0000031e <gets>:

char*
gets(char *buf, int max)
{
 31e:	55                   	push   %ebp
 31f:	89 e5                	mov    %esp,%ebp
 321:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 324:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 32b:	eb 4c                	jmp    379 <gets+0x5b>
    cc = read(0, &c, 1);
 32d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 334:	00 
 335:	8d 45 ef             	lea    -0x11(%ebp),%eax
 338:	89 44 24 04          	mov    %eax,0x4(%esp)
 33c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 343:	e8 44 01 00 00       	call   48c <read>
 348:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 34b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 34f:	7f 02                	jg     353 <gets+0x35>
      break;
 351:	eb 31                	jmp    384 <gets+0x66>
    buf[i++] = c;
 353:	8b 45 f4             	mov    -0xc(%ebp),%eax
 356:	8d 50 01             	lea    0x1(%eax),%edx
 359:	89 55 f4             	mov    %edx,-0xc(%ebp)
 35c:	89 c2                	mov    %eax,%edx
 35e:	8b 45 08             	mov    0x8(%ebp),%eax
 361:	01 c2                	add    %eax,%edx
 363:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 367:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 369:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 36d:	3c 0a                	cmp    $0xa,%al
 36f:	74 13                	je     384 <gets+0x66>
 371:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 375:	3c 0d                	cmp    $0xd,%al
 377:	74 0b                	je     384 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 379:	8b 45 f4             	mov    -0xc(%ebp),%eax
 37c:	83 c0 01             	add    $0x1,%eax
 37f:	3b 45 0c             	cmp    0xc(%ebp),%eax
 382:	7c a9                	jl     32d <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 384:	8b 55 f4             	mov    -0xc(%ebp),%edx
 387:	8b 45 08             	mov    0x8(%ebp),%eax
 38a:	01 d0                	add    %edx,%eax
 38c:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 38f:	8b 45 08             	mov    0x8(%ebp),%eax
}
 392:	c9                   	leave  
 393:	c3                   	ret    

00000394 <stat>:

int
stat(char *n, struct stat *st)
{
 394:	55                   	push   %ebp
 395:	89 e5                	mov    %esp,%ebp
 397:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 39a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 3a1:	00 
 3a2:	8b 45 08             	mov    0x8(%ebp),%eax
 3a5:	89 04 24             	mov    %eax,(%esp)
 3a8:	e8 07 01 00 00       	call   4b4 <open>
 3ad:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 3b0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 3b4:	79 07                	jns    3bd <stat+0x29>
    return -1;
 3b6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 3bb:	eb 23                	jmp    3e0 <stat+0x4c>
  r = fstat(fd, st);
 3bd:	8b 45 0c             	mov    0xc(%ebp),%eax
 3c0:	89 44 24 04          	mov    %eax,0x4(%esp)
 3c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3c7:	89 04 24             	mov    %eax,(%esp)
 3ca:	e8 fd 00 00 00       	call   4cc <fstat>
 3cf:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 3d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3d5:	89 04 24             	mov    %eax,(%esp)
 3d8:	e8 bf 00 00 00       	call   49c <close>
  return r;
 3dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 3e0:	c9                   	leave  
 3e1:	c3                   	ret    

000003e2 <atoi>:

int
atoi(const char *s)
{
 3e2:	55                   	push   %ebp
 3e3:	89 e5                	mov    %esp,%ebp
 3e5:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 3e8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 3ef:	eb 25                	jmp    416 <atoi+0x34>
    n = n*10 + *s++ - '0';
 3f1:	8b 55 fc             	mov    -0x4(%ebp),%edx
 3f4:	89 d0                	mov    %edx,%eax
 3f6:	c1 e0 02             	shl    $0x2,%eax
 3f9:	01 d0                	add    %edx,%eax
 3fb:	01 c0                	add    %eax,%eax
 3fd:	89 c1                	mov    %eax,%ecx
 3ff:	8b 45 08             	mov    0x8(%ebp),%eax
 402:	8d 50 01             	lea    0x1(%eax),%edx
 405:	89 55 08             	mov    %edx,0x8(%ebp)
 408:	0f b6 00             	movzbl (%eax),%eax
 40b:	0f be c0             	movsbl %al,%eax
 40e:	01 c8                	add    %ecx,%eax
 410:	83 e8 30             	sub    $0x30,%eax
 413:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 416:	8b 45 08             	mov    0x8(%ebp),%eax
 419:	0f b6 00             	movzbl (%eax),%eax
 41c:	3c 2f                	cmp    $0x2f,%al
 41e:	7e 0a                	jle    42a <atoi+0x48>
 420:	8b 45 08             	mov    0x8(%ebp),%eax
 423:	0f b6 00             	movzbl (%eax),%eax
 426:	3c 39                	cmp    $0x39,%al
 428:	7e c7                	jle    3f1 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 42a:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 42d:	c9                   	leave  
 42e:	c3                   	ret    

0000042f <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 42f:	55                   	push   %ebp
 430:	89 e5                	mov    %esp,%ebp
 432:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 435:	8b 45 08             	mov    0x8(%ebp),%eax
 438:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 43b:	8b 45 0c             	mov    0xc(%ebp),%eax
 43e:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 441:	eb 17                	jmp    45a <memmove+0x2b>
    *dst++ = *src++;
 443:	8b 45 fc             	mov    -0x4(%ebp),%eax
 446:	8d 50 01             	lea    0x1(%eax),%edx
 449:	89 55 fc             	mov    %edx,-0x4(%ebp)
 44c:	8b 55 f8             	mov    -0x8(%ebp),%edx
 44f:	8d 4a 01             	lea    0x1(%edx),%ecx
 452:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 455:	0f b6 12             	movzbl (%edx),%edx
 458:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 45a:	8b 45 10             	mov    0x10(%ebp),%eax
 45d:	8d 50 ff             	lea    -0x1(%eax),%edx
 460:	89 55 10             	mov    %edx,0x10(%ebp)
 463:	85 c0                	test   %eax,%eax
 465:	7f dc                	jg     443 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 467:	8b 45 08             	mov    0x8(%ebp),%eax
}
 46a:	c9                   	leave  
 46b:	c3                   	ret    

0000046c <fork>:
 46c:	b8 01 00 00 00       	mov    $0x1,%eax
 471:	cd 40                	int    $0x40
 473:	c3                   	ret    

00000474 <exit>:
 474:	b8 02 00 00 00       	mov    $0x2,%eax
 479:	cd 40                	int    $0x40
 47b:	c3                   	ret    

0000047c <wait>:
 47c:	b8 03 00 00 00       	mov    $0x3,%eax
 481:	cd 40                	int    $0x40
 483:	c3                   	ret    

00000484 <pipe>:
 484:	b8 04 00 00 00       	mov    $0x4,%eax
 489:	cd 40                	int    $0x40
 48b:	c3                   	ret    

0000048c <read>:
 48c:	b8 05 00 00 00       	mov    $0x5,%eax
 491:	cd 40                	int    $0x40
 493:	c3                   	ret    

00000494 <write>:
 494:	b8 10 00 00 00       	mov    $0x10,%eax
 499:	cd 40                	int    $0x40
 49b:	c3                   	ret    

0000049c <close>:
 49c:	b8 15 00 00 00       	mov    $0x15,%eax
 4a1:	cd 40                	int    $0x40
 4a3:	c3                   	ret    

000004a4 <kill>:
 4a4:	b8 06 00 00 00       	mov    $0x6,%eax
 4a9:	cd 40                	int    $0x40
 4ab:	c3                   	ret    

000004ac <exec>:
 4ac:	b8 07 00 00 00       	mov    $0x7,%eax
 4b1:	cd 40                	int    $0x40
 4b3:	c3                   	ret    

000004b4 <open>:
 4b4:	b8 0f 00 00 00       	mov    $0xf,%eax
 4b9:	cd 40                	int    $0x40
 4bb:	c3                   	ret    

000004bc <mknod>:
 4bc:	b8 11 00 00 00       	mov    $0x11,%eax
 4c1:	cd 40                	int    $0x40
 4c3:	c3                   	ret    

000004c4 <unlink>:
 4c4:	b8 12 00 00 00       	mov    $0x12,%eax
 4c9:	cd 40                	int    $0x40
 4cb:	c3                   	ret    

000004cc <fstat>:
 4cc:	b8 08 00 00 00       	mov    $0x8,%eax
 4d1:	cd 40                	int    $0x40
 4d3:	c3                   	ret    

000004d4 <link>:
 4d4:	b8 13 00 00 00       	mov    $0x13,%eax
 4d9:	cd 40                	int    $0x40
 4db:	c3                   	ret    

000004dc <mkdir>:
 4dc:	b8 14 00 00 00       	mov    $0x14,%eax
 4e1:	cd 40                	int    $0x40
 4e3:	c3                   	ret    

000004e4 <chdir>:
 4e4:	b8 09 00 00 00       	mov    $0x9,%eax
 4e9:	cd 40                	int    $0x40
 4eb:	c3                   	ret    

000004ec <dup>:
 4ec:	b8 0a 00 00 00       	mov    $0xa,%eax
 4f1:	cd 40                	int    $0x40
 4f3:	c3                   	ret    

000004f4 <getpid>:
 4f4:	b8 0b 00 00 00       	mov    $0xb,%eax
 4f9:	cd 40                	int    $0x40
 4fb:	c3                   	ret    

000004fc <sbrk>:
 4fc:	b8 0c 00 00 00       	mov    $0xc,%eax
 501:	cd 40                	int    $0x40
 503:	c3                   	ret    

00000504 <sleep>:
 504:	b8 0d 00 00 00       	mov    $0xd,%eax
 509:	cd 40                	int    $0x40
 50b:	c3                   	ret    

0000050c <uptime>:
 50c:	b8 0e 00 00 00       	mov    $0xe,%eax
 511:	cd 40                	int    $0x40
 513:	c3                   	ret    

00000514 <exit_status>:
 514:	b8 16 00 00 00       	mov    $0x16,%eax
 519:	cd 40                	int    $0x40
 51b:	c3                   	ret    

0000051c <wait_status>:
 51c:	b8 17 00 00 00       	mov    $0x17,%eax
 521:	cd 40                	int    $0x40
 523:	c3                   	ret    

00000524 <waitpid>:
 524:	b8 18 00 00 00       	mov    $0x18,%eax
 529:	cd 40                	int    $0x40
 52b:	c3                   	ret    

0000052c <change_priority>:
 52c:	b8 19 00 00 00       	mov    $0x19,%eax
 531:	cd 40                	int    $0x40
 533:	c3                   	ret    

00000534 <set_priority>:
 534:	b8 1a 00 00 00       	mov    $0x1a,%eax
 539:	cd 40                	int    $0x40
 53b:	c3                   	ret    

0000053c <putc>:
 53c:	55                   	push   %ebp
 53d:	89 e5                	mov    %esp,%ebp
 53f:	83 ec 28             	sub    $0x28,%esp
 542:	8b 45 0c             	mov    0xc(%ebp),%eax
 545:	88 45 f4             	mov    %al,-0xc(%ebp)
 548:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 54f:	00 
 550:	8d 45 f4             	lea    -0xc(%ebp),%eax
 553:	89 44 24 04          	mov    %eax,0x4(%esp)
 557:	8b 45 08             	mov    0x8(%ebp),%eax
 55a:	89 04 24             	mov    %eax,(%esp)
 55d:	e8 32 ff ff ff       	call   494 <write>
 562:	c9                   	leave  
 563:	c3                   	ret    

00000564 <printint>:
 564:	55                   	push   %ebp
 565:	89 e5                	mov    %esp,%ebp
 567:	53                   	push   %ebx
 568:	83 ec 44             	sub    $0x44,%esp
 56b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 572:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 576:	74 17                	je     58f <printint+0x2b>
 578:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 57c:	79 11                	jns    58f <printint+0x2b>
 57e:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
 585:	8b 45 0c             	mov    0xc(%ebp),%eax
 588:	f7 d8                	neg    %eax
 58a:	89 45 f4             	mov    %eax,-0xc(%ebp)
 58d:	eb 06                	jmp    595 <printint+0x31>
 58f:	8b 45 0c             	mov    0xc(%ebp),%eax
 592:	89 45 f4             	mov    %eax,-0xc(%ebp)
 595:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 59c:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 59f:	8b 5d 10             	mov    0x10(%ebp),%ebx
 5a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5a5:	ba 00 00 00 00       	mov    $0x0,%edx
 5aa:	f7 f3                	div    %ebx
 5ac:	89 d0                	mov    %edx,%eax
 5ae:	0f b6 80 60 0c 00 00 	movzbl 0xc60(%eax),%eax
 5b5:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 5b9:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 5bd:	8b 45 10             	mov    0x10(%ebp),%eax
 5c0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 5c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5c6:	ba 00 00 00 00       	mov    $0x0,%edx
 5cb:	f7 75 d4             	divl   -0x2c(%ebp)
 5ce:	89 45 f4             	mov    %eax,-0xc(%ebp)
 5d1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5d5:	75 c5                	jne    59c <printint+0x38>
 5d7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 5db:	74 28                	je     605 <printint+0xa1>
 5dd:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5e0:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 5e5:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 5e9:	eb 1a                	jmp    605 <printint+0xa1>
 5eb:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5ee:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
 5f3:	0f be c0             	movsbl %al,%eax
 5f6:	89 44 24 04          	mov    %eax,0x4(%esp)
 5fa:	8b 45 08             	mov    0x8(%ebp),%eax
 5fd:	89 04 24             	mov    %eax,(%esp)
 600:	e8 37 ff ff ff       	call   53c <putc>
 605:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
 609:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 60d:	79 dc                	jns    5eb <printint+0x87>
 60f:	83 c4 44             	add    $0x44,%esp
 612:	5b                   	pop    %ebx
 613:	5d                   	pop    %ebp
 614:	c3                   	ret    

00000615 <printf>:
 615:	55                   	push   %ebp
 616:	89 e5                	mov    %esp,%ebp
 618:	83 ec 38             	sub    $0x38,%esp
 61b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 622:	8d 45 0c             	lea    0xc(%ebp),%eax
 625:	83 c0 04             	add    $0x4,%eax
 628:	89 45 f4             	mov    %eax,-0xc(%ebp)
 62b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 632:	e9 7e 01 00 00       	jmp    7b5 <printf+0x1a0>
 637:	8b 55 0c             	mov    0xc(%ebp),%edx
 63a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 63d:	8d 04 02             	lea    (%edx,%eax,1),%eax
 640:	0f b6 00             	movzbl (%eax),%eax
 643:	0f be c0             	movsbl %al,%eax
 646:	25 ff 00 00 00       	and    $0xff,%eax
 64b:	89 45 e8             	mov    %eax,-0x18(%ebp)
 64e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 652:	75 2c                	jne    680 <printf+0x6b>
 654:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 658:	75 0c                	jne    666 <printf+0x51>
 65a:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
 661:	e9 4b 01 00 00       	jmp    7b1 <printf+0x19c>
 666:	8b 45 e8             	mov    -0x18(%ebp),%eax
 669:	0f be c0             	movsbl %al,%eax
 66c:	89 44 24 04          	mov    %eax,0x4(%esp)
 670:	8b 45 08             	mov    0x8(%ebp),%eax
 673:	89 04 24             	mov    %eax,(%esp)
 676:	e8 c1 fe ff ff       	call   53c <putc>
 67b:	e9 31 01 00 00       	jmp    7b1 <printf+0x19c>
 680:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
 684:	0f 85 27 01 00 00    	jne    7b1 <printf+0x19c>
 68a:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
 68e:	75 2d                	jne    6bd <printf+0xa8>
 690:	8b 45 f4             	mov    -0xc(%ebp),%eax
 693:	8b 00                	mov    (%eax),%eax
 695:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 69c:	00 
 69d:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 6a4:	00 
 6a5:	89 44 24 04          	mov    %eax,0x4(%esp)
 6a9:	8b 45 08             	mov    0x8(%ebp),%eax
 6ac:	89 04 24             	mov    %eax,(%esp)
 6af:	e8 b0 fe ff ff       	call   564 <printint>
 6b4:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 6b8:	e9 ed 00 00 00       	jmp    7aa <printf+0x195>
 6bd:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
 6c1:	74 06                	je     6c9 <printf+0xb4>
 6c3:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
 6c7:	75 2d                	jne    6f6 <printf+0xe1>
 6c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6cc:	8b 00                	mov    (%eax),%eax
 6ce:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 6d5:	00 
 6d6:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 6dd:	00 
 6de:	89 44 24 04          	mov    %eax,0x4(%esp)
 6e2:	8b 45 08             	mov    0x8(%ebp),%eax
 6e5:	89 04 24             	mov    %eax,(%esp)
 6e8:	e8 77 fe ff ff       	call   564 <printint>
 6ed:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 6f1:	e9 b4 00 00 00       	jmp    7aa <printf+0x195>
 6f6:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
 6fa:	75 46                	jne    742 <printf+0x12d>
 6fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6ff:	8b 00                	mov    (%eax),%eax
 701:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 704:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 708:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 70c:	75 27                	jne    735 <printf+0x120>
 70e:	c7 45 e4 7a 0a 00 00 	movl   $0xa7a,-0x1c(%ebp)
 715:	eb 1f                	jmp    736 <printf+0x121>
 717:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 71a:	0f b6 00             	movzbl (%eax),%eax
 71d:	0f be c0             	movsbl %al,%eax
 720:	89 44 24 04          	mov    %eax,0x4(%esp)
 724:	8b 45 08             	mov    0x8(%ebp),%eax
 727:	89 04 24             	mov    %eax,(%esp)
 72a:	e8 0d fe ff ff       	call   53c <putc>
 72f:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 733:	eb 01                	jmp    736 <printf+0x121>
 735:	90                   	nop
 736:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 739:	0f b6 00             	movzbl (%eax),%eax
 73c:	84 c0                	test   %al,%al
 73e:	75 d7                	jne    717 <printf+0x102>
 740:	eb 68                	jmp    7aa <printf+0x195>
 742:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
 746:	75 1d                	jne    765 <printf+0x150>
 748:	8b 45 f4             	mov    -0xc(%ebp),%eax
 74b:	8b 00                	mov    (%eax),%eax
 74d:	0f be c0             	movsbl %al,%eax
 750:	89 44 24 04          	mov    %eax,0x4(%esp)
 754:	8b 45 08             	mov    0x8(%ebp),%eax
 757:	89 04 24             	mov    %eax,(%esp)
 75a:	e8 dd fd ff ff       	call   53c <putc>
 75f:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 763:	eb 45                	jmp    7aa <printf+0x195>
 765:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 769:	75 17                	jne    782 <printf+0x16d>
 76b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 76e:	0f be c0             	movsbl %al,%eax
 771:	89 44 24 04          	mov    %eax,0x4(%esp)
 775:	8b 45 08             	mov    0x8(%ebp),%eax
 778:	89 04 24             	mov    %eax,(%esp)
 77b:	e8 bc fd ff ff       	call   53c <putc>
 780:	eb 28                	jmp    7aa <printf+0x195>
 782:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 789:	00 
 78a:	8b 45 08             	mov    0x8(%ebp),%eax
 78d:	89 04 24             	mov    %eax,(%esp)
 790:	e8 a7 fd ff ff       	call   53c <putc>
 795:	8b 45 e8             	mov    -0x18(%ebp),%eax
 798:	0f be c0             	movsbl %al,%eax
 79b:	89 44 24 04          	mov    %eax,0x4(%esp)
 79f:	8b 45 08             	mov    0x8(%ebp),%eax
 7a2:	89 04 24             	mov    %eax,(%esp)
 7a5:	e8 92 fd ff ff       	call   53c <putc>
 7aa:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 7b1:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 7b5:	8b 55 0c             	mov    0xc(%ebp),%edx
 7b8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7bb:	8d 04 02             	lea    (%edx,%eax,1),%eax
 7be:	0f b6 00             	movzbl (%eax),%eax
 7c1:	84 c0                	test   %al,%al
 7c3:	0f 85 6e fe ff ff    	jne    637 <printf+0x22>
 7c9:	c9                   	leave  
 7ca:	c3                   	ret    
 7cb:	90                   	nop

000007cc <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7cc:	55                   	push   %ebp
 7cd:	89 e5                	mov    %esp,%ebp
 7cf:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7d2:	8b 45 08             	mov    0x8(%ebp),%eax
 7d5:	83 e8 08             	sub    $0x8,%eax
 7d8:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7db:	a1 7c 0c 00 00       	mov    0xc7c,%eax
 7e0:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7e3:	eb 24                	jmp    809 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7e5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e8:	8b 00                	mov    (%eax),%eax
 7ea:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7ed:	77 12                	ja     801 <free+0x35>
 7ef:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7f2:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7f5:	77 24                	ja     81b <free+0x4f>
 7f7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7fa:	8b 00                	mov    (%eax),%eax
 7fc:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7ff:	77 1a                	ja     81b <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 801:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804:	8b 00                	mov    (%eax),%eax
 806:	89 45 fc             	mov    %eax,-0x4(%ebp)
 809:	8b 45 f8             	mov    -0x8(%ebp),%eax
 80c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 80f:	76 d4                	jbe    7e5 <free+0x19>
 811:	8b 45 fc             	mov    -0x4(%ebp),%eax
 814:	8b 00                	mov    (%eax),%eax
 816:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 819:	76 ca                	jbe    7e5 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 81b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 81e:	8b 40 04             	mov    0x4(%eax),%eax
 821:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 828:	8b 45 f8             	mov    -0x8(%ebp),%eax
 82b:	01 c2                	add    %eax,%edx
 82d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 830:	8b 00                	mov    (%eax),%eax
 832:	39 c2                	cmp    %eax,%edx
 834:	75 24                	jne    85a <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 836:	8b 45 f8             	mov    -0x8(%ebp),%eax
 839:	8b 50 04             	mov    0x4(%eax),%edx
 83c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 83f:	8b 00                	mov    (%eax),%eax
 841:	8b 40 04             	mov    0x4(%eax),%eax
 844:	01 c2                	add    %eax,%edx
 846:	8b 45 f8             	mov    -0x8(%ebp),%eax
 849:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 84c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 84f:	8b 00                	mov    (%eax),%eax
 851:	8b 10                	mov    (%eax),%edx
 853:	8b 45 f8             	mov    -0x8(%ebp),%eax
 856:	89 10                	mov    %edx,(%eax)
 858:	eb 0a                	jmp    864 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 85a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 85d:	8b 10                	mov    (%eax),%edx
 85f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 862:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 864:	8b 45 fc             	mov    -0x4(%ebp),%eax
 867:	8b 40 04             	mov    0x4(%eax),%eax
 86a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 871:	8b 45 fc             	mov    -0x4(%ebp),%eax
 874:	01 d0                	add    %edx,%eax
 876:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 879:	75 20                	jne    89b <free+0xcf>
    p->s.size += bp->s.size;
 87b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 87e:	8b 50 04             	mov    0x4(%eax),%edx
 881:	8b 45 f8             	mov    -0x8(%ebp),%eax
 884:	8b 40 04             	mov    0x4(%eax),%eax
 887:	01 c2                	add    %eax,%edx
 889:	8b 45 fc             	mov    -0x4(%ebp),%eax
 88c:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 88f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 892:	8b 10                	mov    (%eax),%edx
 894:	8b 45 fc             	mov    -0x4(%ebp),%eax
 897:	89 10                	mov    %edx,(%eax)
 899:	eb 08                	jmp    8a3 <free+0xd7>
  } else
    p->s.ptr = bp;
 89b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 89e:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8a1:	89 10                	mov    %edx,(%eax)
  freep = p;
 8a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8a6:	a3 7c 0c 00 00       	mov    %eax,0xc7c
}
 8ab:	c9                   	leave  
 8ac:	c3                   	ret    

000008ad <morecore>:

static Header*
morecore(uint nu)
{
 8ad:	55                   	push   %ebp
 8ae:	89 e5                	mov    %esp,%ebp
 8b0:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 8b3:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 8ba:	77 07                	ja     8c3 <morecore+0x16>
    nu = 4096;
 8bc:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 8c3:	8b 45 08             	mov    0x8(%ebp),%eax
 8c6:	c1 e0 03             	shl    $0x3,%eax
 8c9:	89 04 24             	mov    %eax,(%esp)
 8cc:	e8 2b fc ff ff       	call   4fc <sbrk>
 8d1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 8d4:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 8d8:	75 07                	jne    8e1 <morecore+0x34>
    return 0;
 8da:	b8 00 00 00 00       	mov    $0x0,%eax
 8df:	eb 22                	jmp    903 <morecore+0x56>
  hp = (Header*)p;
 8e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8e4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 8e7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8ea:	8b 55 08             	mov    0x8(%ebp),%edx
 8ed:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 8f0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8f3:	83 c0 08             	add    $0x8,%eax
 8f6:	89 04 24             	mov    %eax,(%esp)
 8f9:	e8 ce fe ff ff       	call   7cc <free>
  return freep;
 8fe:	a1 7c 0c 00 00       	mov    0xc7c,%eax
}
 903:	c9                   	leave  
 904:	c3                   	ret    

00000905 <malloc>:

void*
malloc(uint nbytes)
{
 905:	55                   	push   %ebp
 906:	89 e5                	mov    %esp,%ebp
 908:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 90b:	8b 45 08             	mov    0x8(%ebp),%eax
 90e:	83 c0 07             	add    $0x7,%eax
 911:	c1 e8 03             	shr    $0x3,%eax
 914:	83 c0 01             	add    $0x1,%eax
 917:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 91a:	a1 7c 0c 00 00       	mov    0xc7c,%eax
 91f:	89 45 f0             	mov    %eax,-0x10(%ebp)
 922:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 926:	75 23                	jne    94b <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 928:	c7 45 f0 74 0c 00 00 	movl   $0xc74,-0x10(%ebp)
 92f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 932:	a3 7c 0c 00 00       	mov    %eax,0xc7c
 937:	a1 7c 0c 00 00       	mov    0xc7c,%eax
 93c:	a3 74 0c 00 00       	mov    %eax,0xc74
    base.s.size = 0;
 941:	c7 05 78 0c 00 00 00 	movl   $0x0,0xc78
 948:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 94b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 94e:	8b 00                	mov    (%eax),%eax
 950:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 953:	8b 45 f4             	mov    -0xc(%ebp),%eax
 956:	8b 40 04             	mov    0x4(%eax),%eax
 959:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 95c:	72 4d                	jb     9ab <malloc+0xa6>
      if(p->s.size == nunits)
 95e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 961:	8b 40 04             	mov    0x4(%eax),%eax
 964:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 967:	75 0c                	jne    975 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 969:	8b 45 f4             	mov    -0xc(%ebp),%eax
 96c:	8b 10                	mov    (%eax),%edx
 96e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 971:	89 10                	mov    %edx,(%eax)
 973:	eb 26                	jmp    99b <malloc+0x96>
      else {
        p->s.size -= nunits;
 975:	8b 45 f4             	mov    -0xc(%ebp),%eax
 978:	8b 40 04             	mov    0x4(%eax),%eax
 97b:	2b 45 ec             	sub    -0x14(%ebp),%eax
 97e:	89 c2                	mov    %eax,%edx
 980:	8b 45 f4             	mov    -0xc(%ebp),%eax
 983:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 986:	8b 45 f4             	mov    -0xc(%ebp),%eax
 989:	8b 40 04             	mov    0x4(%eax),%eax
 98c:	c1 e0 03             	shl    $0x3,%eax
 98f:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 992:	8b 45 f4             	mov    -0xc(%ebp),%eax
 995:	8b 55 ec             	mov    -0x14(%ebp),%edx
 998:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 99b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 99e:	a3 7c 0c 00 00       	mov    %eax,0xc7c
      return (void*)(p + 1);
 9a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9a6:	83 c0 08             	add    $0x8,%eax
 9a9:	eb 38                	jmp    9e3 <malloc+0xde>
    }
    if(p == freep)
 9ab:	a1 7c 0c 00 00       	mov    0xc7c,%eax
 9b0:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 9b3:	75 1b                	jne    9d0 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 9b5:	8b 45 ec             	mov    -0x14(%ebp),%eax
 9b8:	89 04 24             	mov    %eax,(%esp)
 9bb:	e8 ed fe ff ff       	call   8ad <morecore>
 9c0:	89 45 f4             	mov    %eax,-0xc(%ebp)
 9c3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 9c7:	75 07                	jne    9d0 <malloc+0xcb>
        return 0;
 9c9:	b8 00 00 00 00       	mov    $0x0,%eax
 9ce:	eb 13                	jmp    9e3 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9d3:	89 45 f0             	mov    %eax,-0x10(%ebp)
 9d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9d9:	8b 00                	mov    (%eax),%eax
 9db:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 9de:	e9 70 ff ff ff       	jmp    953 <malloc+0x4e>
}
 9e3:	c9                   	leave  
 9e4:	c3                   	ret    
