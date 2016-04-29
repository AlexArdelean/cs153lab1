
_wait_one:     file format elf32-i386


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
   9:	e8 06 04 00 00       	call   414 <fork>
   e:	89 44 24 2c          	mov    %eax,0x2c(%esp)
    int i;
    int status;
    if(pid > 0){
  12:	83 7c 24 2c 00       	cmpl   $0x0,0x2c(%esp)
  17:	0f 8e 1e 01 00 00    	jle    13b <main+0x13b>
        for(i = 0; i < 15 && pid > 0; i++){
  1d:	c7 44 24 28 00 00 00 	movl   $0x0,0x28(%esp)
  24:	00 
  25:	eb 29                	jmp    50 <main+0x50>
            pid = fork();
  27:	e8 e8 03 00 00       	call   414 <fork>
  2c:	89 44 24 2c          	mov    %eax,0x2c(%esp)
            if(pid < 0)
  30:	83 7c 24 2c 00       	cmpl   $0x0,0x2c(%esp)
  35:	79 14                	jns    4b <main+0x4b>
                printf(1,"errors occur!\n");
  37:	c7 44 24 04 90 09 00 	movl   $0x990,0x4(%esp)
  3e:	00 
  3f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  46:	e8 72 05 00 00       	call   5bd <printf>

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
  63:	0f 85 00 01 00 00    	jne    169 <main+0x169>
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
            if(getpid() == 5) sleep(30);
  84:	e8 13 04 00 00       	call   49c <getpid>
  89:	83 f8 05             	cmp    $0x5,%eax
  8c:	75 0c                	jne    9a <main+0x9a>
  8e:	c7 04 24 1e 00 00 00 	movl   $0x1e,(%esp)
  95:	e8 12 04 00 00       	call   4ac <sleep>
            
            printf(1,"pid = %d\n",getpid());
  9a:	e8 fd 03 00 00       	call   49c <getpid>
  9f:	89 44 24 08          	mov    %eax,0x8(%esp)
  a3:	c7 44 24 04 9f 09 00 	movl   $0x99f,0x4(%esp)
  aa:	00 
  ab:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  b2:	e8 06 05 00 00       	call   5bd <printf>
            if(getpid() == 10){
  b7:	e8 e0 03 00 00       	call   49c <getpid>
  bc:	83 f8 0a             	cmp    $0xa,%eax
  bf:	75 58                	jne    119 <main+0x119>
                printf(1,"pid 10 waiting for 5\n");
  c1:	c7 44 24 04 a9 09 00 	movl   $0x9a9,0x4(%esp)
  c8:	00 
  c9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  d0:	e8 e8 04 00 00       	call   5bd <printf>
                int wpid = waitpid(5,&status,0);
  d5:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  dc:	00 
  dd:	8d 44 24 14          	lea    0x14(%esp),%eax
  e1:	89 44 24 04          	mov    %eax,0x4(%esp)
  e5:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
  ec:	e8 db 03 00 00       	call   4cc <waitpid>
  f1:	89 44 24 18          	mov    %eax,0x18(%esp)
                printf(1,"success clean %d, status is %d\n",wpid,status);
  f5:	8b 44 24 14          	mov    0x14(%esp),%eax
  f9:	89 44 24 0c          	mov    %eax,0xc(%esp)
  fd:	8b 44 24 18          	mov    0x18(%esp),%eax
 101:	89 44 24 08          	mov    %eax,0x8(%esp)
 105:	c7 44 24 04 c0 09 00 	movl   $0x9c0,0x4(%esp)
 10c:	00 
 10d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 114:	e8 a4 04 00 00       	call   5bd <printf>
            }
            if(getpid() == 5){
 119:	e8 7e 03 00 00       	call   49c <getpid>
 11e:	83 f8 05             	cmp    $0x5,%eax
 121:	75 0c                	jne    12f <main+0x12f>
                exit_status(5);
 123:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 12a:	e8 8d 03 00 00       	call   4bc <exit_status>
            }
            exit_status(0);
 12f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 136:	e8 81 03 00 00       	call   4bc <exit_status>
        }
    }else if(pid == 0){
 13b:	83 7c 24 2c 00       	cmpl   $0x0,0x2c(%esp)
 140:	75 27                	jne    169 <main+0x169>
        int j = 0;
 142:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
 149:	00 
        while(j++ < 1000);
 14a:	90                   	nop
 14b:	8b 44 24 20          	mov    0x20(%esp),%eax
 14f:	8d 50 01             	lea    0x1(%eax),%edx
 152:	89 54 24 20          	mov    %edx,0x20(%esp)
 156:	3d e7 03 00 00       	cmp    $0x3e7,%eax
 15b:	7e ee                	jle    14b <main+0x14b>
        exit_status(0);
 15d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 164:	e8 53 03 00 00       	call   4bc <exit_status>
    }
    int going = 1;
 169:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
 170:	00 
    while(going >= 0){
 171:	eb 2c                	jmp    19f <main+0x19f>
        going = wait_status(&status);
 173:	8d 44 24 14          	lea    0x14(%esp),%eax
 177:	89 04 24             	mov    %eax,(%esp)
 17a:	e8 45 03 00 00       	call   4c4 <wait_status>
 17f:	89 44 24 1c          	mov    %eax,0x1c(%esp)
        printf(1,"kill %d\n",going);
 183:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 187:	89 44 24 08          	mov    %eax,0x8(%esp)
 18b:	c7 44 24 04 e0 09 00 	movl   $0x9e0,0x4(%esp)
 192:	00 
 193:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 19a:	e8 1e 04 00 00       	call   5bd <printf>
        int j = 0;
        while(j++ < 1000);
        exit_status(0);
    }
    int going = 1;
    while(going >= 0){
 19f:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
 1a4:	79 cd                	jns    173 <main+0x173>
        going = wait_status(&status);
        printf(1,"kill %d\n",going);
    }
    exit_status(0);
 1a6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1ad:	e8 0a 03 00 00       	call   4bc <exit_status>
 1b2:	66 90                	xchg   %ax,%ax

000001b4 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 1b4:	55                   	push   %ebp
 1b5:	89 e5                	mov    %esp,%ebp
 1b7:	57                   	push   %edi
 1b8:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 1b9:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1bc:	8b 55 10             	mov    0x10(%ebp),%edx
 1bf:	8b 45 0c             	mov    0xc(%ebp),%eax
 1c2:	89 cb                	mov    %ecx,%ebx
 1c4:	89 df                	mov    %ebx,%edi
 1c6:	89 d1                	mov    %edx,%ecx
 1c8:	fc                   	cld    
 1c9:	f3 aa                	rep stos %al,%es:(%edi)
 1cb:	89 ca                	mov    %ecx,%edx
 1cd:	89 fb                	mov    %edi,%ebx
 1cf:	89 5d 08             	mov    %ebx,0x8(%ebp)
 1d2:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 1d5:	5b                   	pop    %ebx
 1d6:	5f                   	pop    %edi
 1d7:	5d                   	pop    %ebp
 1d8:	c3                   	ret    

000001d9 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 1d9:	55                   	push   %ebp
 1da:	89 e5                	mov    %esp,%ebp
 1dc:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 1df:	8b 45 08             	mov    0x8(%ebp),%eax
 1e2:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 1e5:	90                   	nop
 1e6:	8b 45 08             	mov    0x8(%ebp),%eax
 1e9:	8d 50 01             	lea    0x1(%eax),%edx
 1ec:	89 55 08             	mov    %edx,0x8(%ebp)
 1ef:	8b 55 0c             	mov    0xc(%ebp),%edx
 1f2:	8d 4a 01             	lea    0x1(%edx),%ecx
 1f5:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 1f8:	0f b6 12             	movzbl (%edx),%edx
 1fb:	88 10                	mov    %dl,(%eax)
 1fd:	0f b6 00             	movzbl (%eax),%eax
 200:	84 c0                	test   %al,%al
 202:	75 e2                	jne    1e6 <strcpy+0xd>
    ;
  return os;
 204:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 207:	c9                   	leave  
 208:	c3                   	ret    

00000209 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 209:	55                   	push   %ebp
 20a:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 20c:	eb 08                	jmp    216 <strcmp+0xd>
    p++, q++;
 20e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 212:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 216:	8b 45 08             	mov    0x8(%ebp),%eax
 219:	0f b6 00             	movzbl (%eax),%eax
 21c:	84 c0                	test   %al,%al
 21e:	74 10                	je     230 <strcmp+0x27>
 220:	8b 45 08             	mov    0x8(%ebp),%eax
 223:	0f b6 10             	movzbl (%eax),%edx
 226:	8b 45 0c             	mov    0xc(%ebp),%eax
 229:	0f b6 00             	movzbl (%eax),%eax
 22c:	38 c2                	cmp    %al,%dl
 22e:	74 de                	je     20e <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 230:	8b 45 08             	mov    0x8(%ebp),%eax
 233:	0f b6 00             	movzbl (%eax),%eax
 236:	0f b6 d0             	movzbl %al,%edx
 239:	8b 45 0c             	mov    0xc(%ebp),%eax
 23c:	0f b6 00             	movzbl (%eax),%eax
 23f:	0f b6 c0             	movzbl %al,%eax
 242:	29 c2                	sub    %eax,%edx
 244:	89 d0                	mov    %edx,%eax
}
 246:	5d                   	pop    %ebp
 247:	c3                   	ret    

00000248 <strlen>:

uint
strlen(char *s)
{
 248:	55                   	push   %ebp
 249:	89 e5                	mov    %esp,%ebp
 24b:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 24e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 255:	eb 04                	jmp    25b <strlen+0x13>
 257:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 25b:	8b 55 fc             	mov    -0x4(%ebp),%edx
 25e:	8b 45 08             	mov    0x8(%ebp),%eax
 261:	01 d0                	add    %edx,%eax
 263:	0f b6 00             	movzbl (%eax),%eax
 266:	84 c0                	test   %al,%al
 268:	75 ed                	jne    257 <strlen+0xf>
    ;
  return n;
 26a:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 26d:	c9                   	leave  
 26e:	c3                   	ret    

0000026f <memset>:

void*
memset(void *dst, int c, uint n)
{
 26f:	55                   	push   %ebp
 270:	89 e5                	mov    %esp,%ebp
 272:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 275:	8b 45 10             	mov    0x10(%ebp),%eax
 278:	89 44 24 08          	mov    %eax,0x8(%esp)
 27c:	8b 45 0c             	mov    0xc(%ebp),%eax
 27f:	89 44 24 04          	mov    %eax,0x4(%esp)
 283:	8b 45 08             	mov    0x8(%ebp),%eax
 286:	89 04 24             	mov    %eax,(%esp)
 289:	e8 26 ff ff ff       	call   1b4 <stosb>
  return dst;
 28e:	8b 45 08             	mov    0x8(%ebp),%eax
}
 291:	c9                   	leave  
 292:	c3                   	ret    

00000293 <strchr>:

char*
strchr(const char *s, char c)
{
 293:	55                   	push   %ebp
 294:	89 e5                	mov    %esp,%ebp
 296:	83 ec 04             	sub    $0x4,%esp
 299:	8b 45 0c             	mov    0xc(%ebp),%eax
 29c:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 29f:	eb 14                	jmp    2b5 <strchr+0x22>
    if(*s == c)
 2a1:	8b 45 08             	mov    0x8(%ebp),%eax
 2a4:	0f b6 00             	movzbl (%eax),%eax
 2a7:	3a 45 fc             	cmp    -0x4(%ebp),%al
 2aa:	75 05                	jne    2b1 <strchr+0x1e>
      return (char*)s;
 2ac:	8b 45 08             	mov    0x8(%ebp),%eax
 2af:	eb 13                	jmp    2c4 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 2b1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2b5:	8b 45 08             	mov    0x8(%ebp),%eax
 2b8:	0f b6 00             	movzbl (%eax),%eax
 2bb:	84 c0                	test   %al,%al
 2bd:	75 e2                	jne    2a1 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 2bf:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2c4:	c9                   	leave  
 2c5:	c3                   	ret    

000002c6 <gets>:

char*
gets(char *buf, int max)
{
 2c6:	55                   	push   %ebp
 2c7:	89 e5                	mov    %esp,%ebp
 2c9:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2cc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 2d3:	eb 4c                	jmp    321 <gets+0x5b>
    cc = read(0, &c, 1);
 2d5:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 2dc:	00 
 2dd:	8d 45 ef             	lea    -0x11(%ebp),%eax
 2e0:	89 44 24 04          	mov    %eax,0x4(%esp)
 2e4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 2eb:	e8 44 01 00 00       	call   434 <read>
 2f0:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 2f3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 2f7:	7f 02                	jg     2fb <gets+0x35>
      break;
 2f9:	eb 31                	jmp    32c <gets+0x66>
    buf[i++] = c;
 2fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2fe:	8d 50 01             	lea    0x1(%eax),%edx
 301:	89 55 f4             	mov    %edx,-0xc(%ebp)
 304:	89 c2                	mov    %eax,%edx
 306:	8b 45 08             	mov    0x8(%ebp),%eax
 309:	01 c2                	add    %eax,%edx
 30b:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 30f:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 311:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 315:	3c 0a                	cmp    $0xa,%al
 317:	74 13                	je     32c <gets+0x66>
 319:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 31d:	3c 0d                	cmp    $0xd,%al
 31f:	74 0b                	je     32c <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 321:	8b 45 f4             	mov    -0xc(%ebp),%eax
 324:	83 c0 01             	add    $0x1,%eax
 327:	3b 45 0c             	cmp    0xc(%ebp),%eax
 32a:	7c a9                	jl     2d5 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 32c:	8b 55 f4             	mov    -0xc(%ebp),%edx
 32f:	8b 45 08             	mov    0x8(%ebp),%eax
 332:	01 d0                	add    %edx,%eax
 334:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 337:	8b 45 08             	mov    0x8(%ebp),%eax
}
 33a:	c9                   	leave  
 33b:	c3                   	ret    

0000033c <stat>:

int
stat(char *n, struct stat *st)
{
 33c:	55                   	push   %ebp
 33d:	89 e5                	mov    %esp,%ebp
 33f:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 342:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 349:	00 
 34a:	8b 45 08             	mov    0x8(%ebp),%eax
 34d:	89 04 24             	mov    %eax,(%esp)
 350:	e8 07 01 00 00       	call   45c <open>
 355:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 358:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 35c:	79 07                	jns    365 <stat+0x29>
    return -1;
 35e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 363:	eb 23                	jmp    388 <stat+0x4c>
  r = fstat(fd, st);
 365:	8b 45 0c             	mov    0xc(%ebp),%eax
 368:	89 44 24 04          	mov    %eax,0x4(%esp)
 36c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 36f:	89 04 24             	mov    %eax,(%esp)
 372:	e8 fd 00 00 00       	call   474 <fstat>
 377:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 37a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 37d:	89 04 24             	mov    %eax,(%esp)
 380:	e8 bf 00 00 00       	call   444 <close>
  return r;
 385:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 388:	c9                   	leave  
 389:	c3                   	ret    

0000038a <atoi>:

int
atoi(const char *s)
{
 38a:	55                   	push   %ebp
 38b:	89 e5                	mov    %esp,%ebp
 38d:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 390:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 397:	eb 25                	jmp    3be <atoi+0x34>
    n = n*10 + *s++ - '0';
 399:	8b 55 fc             	mov    -0x4(%ebp),%edx
 39c:	89 d0                	mov    %edx,%eax
 39e:	c1 e0 02             	shl    $0x2,%eax
 3a1:	01 d0                	add    %edx,%eax
 3a3:	01 c0                	add    %eax,%eax
 3a5:	89 c1                	mov    %eax,%ecx
 3a7:	8b 45 08             	mov    0x8(%ebp),%eax
 3aa:	8d 50 01             	lea    0x1(%eax),%edx
 3ad:	89 55 08             	mov    %edx,0x8(%ebp)
 3b0:	0f b6 00             	movzbl (%eax),%eax
 3b3:	0f be c0             	movsbl %al,%eax
 3b6:	01 c8                	add    %ecx,%eax
 3b8:	83 e8 30             	sub    $0x30,%eax
 3bb:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3be:	8b 45 08             	mov    0x8(%ebp),%eax
 3c1:	0f b6 00             	movzbl (%eax),%eax
 3c4:	3c 2f                	cmp    $0x2f,%al
 3c6:	7e 0a                	jle    3d2 <atoi+0x48>
 3c8:	8b 45 08             	mov    0x8(%ebp),%eax
 3cb:	0f b6 00             	movzbl (%eax),%eax
 3ce:	3c 39                	cmp    $0x39,%al
 3d0:	7e c7                	jle    399 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 3d2:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3d5:	c9                   	leave  
 3d6:	c3                   	ret    

000003d7 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 3d7:	55                   	push   %ebp
 3d8:	89 e5                	mov    %esp,%ebp
 3da:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 3dd:	8b 45 08             	mov    0x8(%ebp),%eax
 3e0:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 3e3:	8b 45 0c             	mov    0xc(%ebp),%eax
 3e6:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 3e9:	eb 17                	jmp    402 <memmove+0x2b>
    *dst++ = *src++;
 3eb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 3ee:	8d 50 01             	lea    0x1(%eax),%edx
 3f1:	89 55 fc             	mov    %edx,-0x4(%ebp)
 3f4:	8b 55 f8             	mov    -0x8(%ebp),%edx
 3f7:	8d 4a 01             	lea    0x1(%edx),%ecx
 3fa:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 3fd:	0f b6 12             	movzbl (%edx),%edx
 400:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 402:	8b 45 10             	mov    0x10(%ebp),%eax
 405:	8d 50 ff             	lea    -0x1(%eax),%edx
 408:	89 55 10             	mov    %edx,0x10(%ebp)
 40b:	85 c0                	test   %eax,%eax
 40d:	7f dc                	jg     3eb <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 40f:	8b 45 08             	mov    0x8(%ebp),%eax
}
 412:	c9                   	leave  
 413:	c3                   	ret    

00000414 <fork>:
 414:	b8 01 00 00 00       	mov    $0x1,%eax
 419:	cd 40                	int    $0x40
 41b:	c3                   	ret    

0000041c <exit>:
 41c:	b8 02 00 00 00       	mov    $0x2,%eax
 421:	cd 40                	int    $0x40
 423:	c3                   	ret    

00000424 <wait>:
 424:	b8 03 00 00 00       	mov    $0x3,%eax
 429:	cd 40                	int    $0x40
 42b:	c3                   	ret    

0000042c <pipe>:
 42c:	b8 04 00 00 00       	mov    $0x4,%eax
 431:	cd 40                	int    $0x40
 433:	c3                   	ret    

00000434 <read>:
 434:	b8 05 00 00 00       	mov    $0x5,%eax
 439:	cd 40                	int    $0x40
 43b:	c3                   	ret    

0000043c <write>:
 43c:	b8 10 00 00 00       	mov    $0x10,%eax
 441:	cd 40                	int    $0x40
 443:	c3                   	ret    

00000444 <close>:
 444:	b8 15 00 00 00       	mov    $0x15,%eax
 449:	cd 40                	int    $0x40
 44b:	c3                   	ret    

0000044c <kill>:
 44c:	b8 06 00 00 00       	mov    $0x6,%eax
 451:	cd 40                	int    $0x40
 453:	c3                   	ret    

00000454 <exec>:
 454:	b8 07 00 00 00       	mov    $0x7,%eax
 459:	cd 40                	int    $0x40
 45b:	c3                   	ret    

0000045c <open>:
 45c:	b8 0f 00 00 00       	mov    $0xf,%eax
 461:	cd 40                	int    $0x40
 463:	c3                   	ret    

00000464 <mknod>:
 464:	b8 11 00 00 00       	mov    $0x11,%eax
 469:	cd 40                	int    $0x40
 46b:	c3                   	ret    

0000046c <unlink>:
 46c:	b8 12 00 00 00       	mov    $0x12,%eax
 471:	cd 40                	int    $0x40
 473:	c3                   	ret    

00000474 <fstat>:
 474:	b8 08 00 00 00       	mov    $0x8,%eax
 479:	cd 40                	int    $0x40
 47b:	c3                   	ret    

0000047c <link>:
 47c:	b8 13 00 00 00       	mov    $0x13,%eax
 481:	cd 40                	int    $0x40
 483:	c3                   	ret    

00000484 <mkdir>:
 484:	b8 14 00 00 00       	mov    $0x14,%eax
 489:	cd 40                	int    $0x40
 48b:	c3                   	ret    

0000048c <chdir>:
 48c:	b8 09 00 00 00       	mov    $0x9,%eax
 491:	cd 40                	int    $0x40
 493:	c3                   	ret    

00000494 <dup>:
 494:	b8 0a 00 00 00       	mov    $0xa,%eax
 499:	cd 40                	int    $0x40
 49b:	c3                   	ret    

0000049c <getpid>:
 49c:	b8 0b 00 00 00       	mov    $0xb,%eax
 4a1:	cd 40                	int    $0x40
 4a3:	c3                   	ret    

000004a4 <sbrk>:
 4a4:	b8 0c 00 00 00       	mov    $0xc,%eax
 4a9:	cd 40                	int    $0x40
 4ab:	c3                   	ret    

000004ac <sleep>:
 4ac:	b8 0d 00 00 00       	mov    $0xd,%eax
 4b1:	cd 40                	int    $0x40
 4b3:	c3                   	ret    

000004b4 <uptime>:
 4b4:	b8 0e 00 00 00       	mov    $0xe,%eax
 4b9:	cd 40                	int    $0x40
 4bb:	c3                   	ret    

000004bc <exit_status>:
 4bc:	b8 16 00 00 00       	mov    $0x16,%eax
 4c1:	cd 40                	int    $0x40
 4c3:	c3                   	ret    

000004c4 <wait_status>:
 4c4:	b8 17 00 00 00       	mov    $0x17,%eax
 4c9:	cd 40                	int    $0x40
 4cb:	c3                   	ret    

000004cc <waitpid>:
 4cc:	b8 18 00 00 00       	mov    $0x18,%eax
 4d1:	cd 40                	int    $0x40
 4d3:	c3                   	ret    

000004d4 <change_priority>:
 4d4:	b8 19 00 00 00       	mov    $0x19,%eax
 4d9:	cd 40                	int    $0x40
 4db:	c3                   	ret    

000004dc <set_priority>:
 4dc:	b8 1a 00 00 00       	mov    $0x1a,%eax
 4e1:	cd 40                	int    $0x40
 4e3:	c3                   	ret    

000004e4 <putc>:
 4e4:	55                   	push   %ebp
 4e5:	89 e5                	mov    %esp,%ebp
 4e7:	83 ec 28             	sub    $0x28,%esp
 4ea:	8b 45 0c             	mov    0xc(%ebp),%eax
 4ed:	88 45 f4             	mov    %al,-0xc(%ebp)
 4f0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4f7:	00 
 4f8:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4fb:	89 44 24 04          	mov    %eax,0x4(%esp)
 4ff:	8b 45 08             	mov    0x8(%ebp),%eax
 502:	89 04 24             	mov    %eax,(%esp)
 505:	e8 32 ff ff ff       	call   43c <write>
 50a:	c9                   	leave  
 50b:	c3                   	ret    

0000050c <printint>:
 50c:	55                   	push   %ebp
 50d:	89 e5                	mov    %esp,%ebp
 50f:	53                   	push   %ebx
 510:	83 ec 44             	sub    $0x44,%esp
 513:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 51a:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 51e:	74 17                	je     537 <printint+0x2b>
 520:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 524:	79 11                	jns    537 <printint+0x2b>
 526:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
 52d:	8b 45 0c             	mov    0xc(%ebp),%eax
 530:	f7 d8                	neg    %eax
 532:	89 45 f4             	mov    %eax,-0xc(%ebp)
 535:	eb 06                	jmp    53d <printint+0x31>
 537:	8b 45 0c             	mov    0xc(%ebp),%eax
 53a:	89 45 f4             	mov    %eax,-0xc(%ebp)
 53d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 544:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 547:	8b 5d 10             	mov    0x10(%ebp),%ebx
 54a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 54d:	ba 00 00 00 00       	mov    $0x0,%edx
 552:	f7 f3                	div    %ebx
 554:	89 d0                	mov    %edx,%eax
 556:	0f b6 80 cc 0b 00 00 	movzbl 0xbcc(%eax),%eax
 55d:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 561:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 565:	8b 45 10             	mov    0x10(%ebp),%eax
 568:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 56b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 56e:	ba 00 00 00 00       	mov    $0x0,%edx
 573:	f7 75 d4             	divl   -0x2c(%ebp)
 576:	89 45 f4             	mov    %eax,-0xc(%ebp)
 579:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 57d:	75 c5                	jne    544 <printint+0x38>
 57f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 583:	74 28                	je     5ad <printint+0xa1>
 585:	8b 45 ec             	mov    -0x14(%ebp),%eax
 588:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 58d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 591:	eb 1a                	jmp    5ad <printint+0xa1>
 593:	8b 45 ec             	mov    -0x14(%ebp),%eax
 596:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
 59b:	0f be c0             	movsbl %al,%eax
 59e:	89 44 24 04          	mov    %eax,0x4(%esp)
 5a2:	8b 45 08             	mov    0x8(%ebp),%eax
 5a5:	89 04 24             	mov    %eax,(%esp)
 5a8:	e8 37 ff ff ff       	call   4e4 <putc>
 5ad:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
 5b1:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5b5:	79 dc                	jns    593 <printint+0x87>
 5b7:	83 c4 44             	add    $0x44,%esp
 5ba:	5b                   	pop    %ebx
 5bb:	5d                   	pop    %ebp
 5bc:	c3                   	ret    

000005bd <printf>:
 5bd:	55                   	push   %ebp
 5be:	89 e5                	mov    %esp,%ebp
 5c0:	83 ec 38             	sub    $0x38,%esp
 5c3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 5ca:	8d 45 0c             	lea    0xc(%ebp),%eax
 5cd:	83 c0 04             	add    $0x4,%eax
 5d0:	89 45 f4             	mov    %eax,-0xc(%ebp)
 5d3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 5da:	e9 7e 01 00 00       	jmp    75d <printf+0x1a0>
 5df:	8b 55 0c             	mov    0xc(%ebp),%edx
 5e2:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5e5:	8d 04 02             	lea    (%edx,%eax,1),%eax
 5e8:	0f b6 00             	movzbl (%eax),%eax
 5eb:	0f be c0             	movsbl %al,%eax
 5ee:	25 ff 00 00 00       	and    $0xff,%eax
 5f3:	89 45 e8             	mov    %eax,-0x18(%ebp)
 5f6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 5fa:	75 2c                	jne    628 <printf+0x6b>
 5fc:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 600:	75 0c                	jne    60e <printf+0x51>
 602:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
 609:	e9 4b 01 00 00       	jmp    759 <printf+0x19c>
 60e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 611:	0f be c0             	movsbl %al,%eax
 614:	89 44 24 04          	mov    %eax,0x4(%esp)
 618:	8b 45 08             	mov    0x8(%ebp),%eax
 61b:	89 04 24             	mov    %eax,(%esp)
 61e:	e8 c1 fe ff ff       	call   4e4 <putc>
 623:	e9 31 01 00 00       	jmp    759 <printf+0x19c>
 628:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
 62c:	0f 85 27 01 00 00    	jne    759 <printf+0x19c>
 632:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
 636:	75 2d                	jne    665 <printf+0xa8>
 638:	8b 45 f4             	mov    -0xc(%ebp),%eax
 63b:	8b 00                	mov    (%eax),%eax
 63d:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 644:	00 
 645:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 64c:	00 
 64d:	89 44 24 04          	mov    %eax,0x4(%esp)
 651:	8b 45 08             	mov    0x8(%ebp),%eax
 654:	89 04 24             	mov    %eax,(%esp)
 657:	e8 b0 fe ff ff       	call   50c <printint>
 65c:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 660:	e9 ed 00 00 00       	jmp    752 <printf+0x195>
 665:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
 669:	74 06                	je     671 <printf+0xb4>
 66b:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
 66f:	75 2d                	jne    69e <printf+0xe1>
 671:	8b 45 f4             	mov    -0xc(%ebp),%eax
 674:	8b 00                	mov    (%eax),%eax
 676:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 67d:	00 
 67e:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 685:	00 
 686:	89 44 24 04          	mov    %eax,0x4(%esp)
 68a:	8b 45 08             	mov    0x8(%ebp),%eax
 68d:	89 04 24             	mov    %eax,(%esp)
 690:	e8 77 fe ff ff       	call   50c <printint>
 695:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 699:	e9 b4 00 00 00       	jmp    752 <printf+0x195>
 69e:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
 6a2:	75 46                	jne    6ea <printf+0x12d>
 6a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6a7:	8b 00                	mov    (%eax),%eax
 6a9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 6ac:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 6b0:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 6b4:	75 27                	jne    6dd <printf+0x120>
 6b6:	c7 45 e4 e9 09 00 00 	movl   $0x9e9,-0x1c(%ebp)
 6bd:	eb 1f                	jmp    6de <printf+0x121>
 6bf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6c2:	0f b6 00             	movzbl (%eax),%eax
 6c5:	0f be c0             	movsbl %al,%eax
 6c8:	89 44 24 04          	mov    %eax,0x4(%esp)
 6cc:	8b 45 08             	mov    0x8(%ebp),%eax
 6cf:	89 04 24             	mov    %eax,(%esp)
 6d2:	e8 0d fe ff ff       	call   4e4 <putc>
 6d7:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 6db:	eb 01                	jmp    6de <printf+0x121>
 6dd:	90                   	nop
 6de:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6e1:	0f b6 00             	movzbl (%eax),%eax
 6e4:	84 c0                	test   %al,%al
 6e6:	75 d7                	jne    6bf <printf+0x102>
 6e8:	eb 68                	jmp    752 <printf+0x195>
 6ea:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
 6ee:	75 1d                	jne    70d <printf+0x150>
 6f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6f3:	8b 00                	mov    (%eax),%eax
 6f5:	0f be c0             	movsbl %al,%eax
 6f8:	89 44 24 04          	mov    %eax,0x4(%esp)
 6fc:	8b 45 08             	mov    0x8(%ebp),%eax
 6ff:	89 04 24             	mov    %eax,(%esp)
 702:	e8 dd fd ff ff       	call   4e4 <putc>
 707:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 70b:	eb 45                	jmp    752 <printf+0x195>
 70d:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 711:	75 17                	jne    72a <printf+0x16d>
 713:	8b 45 e8             	mov    -0x18(%ebp),%eax
 716:	0f be c0             	movsbl %al,%eax
 719:	89 44 24 04          	mov    %eax,0x4(%esp)
 71d:	8b 45 08             	mov    0x8(%ebp),%eax
 720:	89 04 24             	mov    %eax,(%esp)
 723:	e8 bc fd ff ff       	call   4e4 <putc>
 728:	eb 28                	jmp    752 <printf+0x195>
 72a:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 731:	00 
 732:	8b 45 08             	mov    0x8(%ebp),%eax
 735:	89 04 24             	mov    %eax,(%esp)
 738:	e8 a7 fd ff ff       	call   4e4 <putc>
 73d:	8b 45 e8             	mov    -0x18(%ebp),%eax
 740:	0f be c0             	movsbl %al,%eax
 743:	89 44 24 04          	mov    %eax,0x4(%esp)
 747:	8b 45 08             	mov    0x8(%ebp),%eax
 74a:	89 04 24             	mov    %eax,(%esp)
 74d:	e8 92 fd ff ff       	call   4e4 <putc>
 752:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 759:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 75d:	8b 55 0c             	mov    0xc(%ebp),%edx
 760:	8b 45 ec             	mov    -0x14(%ebp),%eax
 763:	8d 04 02             	lea    (%edx,%eax,1),%eax
 766:	0f b6 00             	movzbl (%eax),%eax
 769:	84 c0                	test   %al,%al
 76b:	0f 85 6e fe ff ff    	jne    5df <printf+0x22>
 771:	c9                   	leave  
 772:	c3                   	ret    
 773:	90                   	nop

00000774 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 774:	55                   	push   %ebp
 775:	89 e5                	mov    %esp,%ebp
 777:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 77a:	8b 45 08             	mov    0x8(%ebp),%eax
 77d:	83 e8 08             	sub    $0x8,%eax
 780:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 783:	a1 e8 0b 00 00       	mov    0xbe8,%eax
 788:	89 45 fc             	mov    %eax,-0x4(%ebp)
 78b:	eb 24                	jmp    7b1 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 78d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 790:	8b 00                	mov    (%eax),%eax
 792:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 795:	77 12                	ja     7a9 <free+0x35>
 797:	8b 45 f8             	mov    -0x8(%ebp),%eax
 79a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 79d:	77 24                	ja     7c3 <free+0x4f>
 79f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a2:	8b 00                	mov    (%eax),%eax
 7a4:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7a7:	77 1a                	ja     7c3 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7a9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ac:	8b 00                	mov    (%eax),%eax
 7ae:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7b1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7b4:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7b7:	76 d4                	jbe    78d <free+0x19>
 7b9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7bc:	8b 00                	mov    (%eax),%eax
 7be:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7c1:	76 ca                	jbe    78d <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 7c3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7c6:	8b 40 04             	mov    0x4(%eax),%eax
 7c9:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7d0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7d3:	01 c2                	add    %eax,%edx
 7d5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d8:	8b 00                	mov    (%eax),%eax
 7da:	39 c2                	cmp    %eax,%edx
 7dc:	75 24                	jne    802 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 7de:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7e1:	8b 50 04             	mov    0x4(%eax),%edx
 7e4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e7:	8b 00                	mov    (%eax),%eax
 7e9:	8b 40 04             	mov    0x4(%eax),%eax
 7ec:	01 c2                	add    %eax,%edx
 7ee:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7f1:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 7f4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f7:	8b 00                	mov    (%eax),%eax
 7f9:	8b 10                	mov    (%eax),%edx
 7fb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7fe:	89 10                	mov    %edx,(%eax)
 800:	eb 0a                	jmp    80c <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 802:	8b 45 fc             	mov    -0x4(%ebp),%eax
 805:	8b 10                	mov    (%eax),%edx
 807:	8b 45 f8             	mov    -0x8(%ebp),%eax
 80a:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 80c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80f:	8b 40 04             	mov    0x4(%eax),%eax
 812:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 819:	8b 45 fc             	mov    -0x4(%ebp),%eax
 81c:	01 d0                	add    %edx,%eax
 81e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 821:	75 20                	jne    843 <free+0xcf>
    p->s.size += bp->s.size;
 823:	8b 45 fc             	mov    -0x4(%ebp),%eax
 826:	8b 50 04             	mov    0x4(%eax),%edx
 829:	8b 45 f8             	mov    -0x8(%ebp),%eax
 82c:	8b 40 04             	mov    0x4(%eax),%eax
 82f:	01 c2                	add    %eax,%edx
 831:	8b 45 fc             	mov    -0x4(%ebp),%eax
 834:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 837:	8b 45 f8             	mov    -0x8(%ebp),%eax
 83a:	8b 10                	mov    (%eax),%edx
 83c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 83f:	89 10                	mov    %edx,(%eax)
 841:	eb 08                	jmp    84b <free+0xd7>
  } else
    p->s.ptr = bp;
 843:	8b 45 fc             	mov    -0x4(%ebp),%eax
 846:	8b 55 f8             	mov    -0x8(%ebp),%edx
 849:	89 10                	mov    %edx,(%eax)
  freep = p;
 84b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 84e:	a3 e8 0b 00 00       	mov    %eax,0xbe8
}
 853:	c9                   	leave  
 854:	c3                   	ret    

00000855 <morecore>:

static Header*
morecore(uint nu)
{
 855:	55                   	push   %ebp
 856:	89 e5                	mov    %esp,%ebp
 858:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 85b:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 862:	77 07                	ja     86b <morecore+0x16>
    nu = 4096;
 864:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 86b:	8b 45 08             	mov    0x8(%ebp),%eax
 86e:	c1 e0 03             	shl    $0x3,%eax
 871:	89 04 24             	mov    %eax,(%esp)
 874:	e8 2b fc ff ff       	call   4a4 <sbrk>
 879:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 87c:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 880:	75 07                	jne    889 <morecore+0x34>
    return 0;
 882:	b8 00 00 00 00       	mov    $0x0,%eax
 887:	eb 22                	jmp    8ab <morecore+0x56>
  hp = (Header*)p;
 889:	8b 45 f4             	mov    -0xc(%ebp),%eax
 88c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 88f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 892:	8b 55 08             	mov    0x8(%ebp),%edx
 895:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 898:	8b 45 f0             	mov    -0x10(%ebp),%eax
 89b:	83 c0 08             	add    $0x8,%eax
 89e:	89 04 24             	mov    %eax,(%esp)
 8a1:	e8 ce fe ff ff       	call   774 <free>
  return freep;
 8a6:	a1 e8 0b 00 00       	mov    0xbe8,%eax
}
 8ab:	c9                   	leave  
 8ac:	c3                   	ret    

000008ad <malloc>:

void*
malloc(uint nbytes)
{
 8ad:	55                   	push   %ebp
 8ae:	89 e5                	mov    %esp,%ebp
 8b0:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8b3:	8b 45 08             	mov    0x8(%ebp),%eax
 8b6:	83 c0 07             	add    $0x7,%eax
 8b9:	c1 e8 03             	shr    $0x3,%eax
 8bc:	83 c0 01             	add    $0x1,%eax
 8bf:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 8c2:	a1 e8 0b 00 00       	mov    0xbe8,%eax
 8c7:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8ca:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8ce:	75 23                	jne    8f3 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 8d0:	c7 45 f0 e0 0b 00 00 	movl   $0xbe0,-0x10(%ebp)
 8d7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8da:	a3 e8 0b 00 00       	mov    %eax,0xbe8
 8df:	a1 e8 0b 00 00       	mov    0xbe8,%eax
 8e4:	a3 e0 0b 00 00       	mov    %eax,0xbe0
    base.s.size = 0;
 8e9:	c7 05 e4 0b 00 00 00 	movl   $0x0,0xbe4
 8f0:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8f3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8f6:	8b 00                	mov    (%eax),%eax
 8f8:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 8fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8fe:	8b 40 04             	mov    0x4(%eax),%eax
 901:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 904:	72 4d                	jb     953 <malloc+0xa6>
      if(p->s.size == nunits)
 906:	8b 45 f4             	mov    -0xc(%ebp),%eax
 909:	8b 40 04             	mov    0x4(%eax),%eax
 90c:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 90f:	75 0c                	jne    91d <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 911:	8b 45 f4             	mov    -0xc(%ebp),%eax
 914:	8b 10                	mov    (%eax),%edx
 916:	8b 45 f0             	mov    -0x10(%ebp),%eax
 919:	89 10                	mov    %edx,(%eax)
 91b:	eb 26                	jmp    943 <malloc+0x96>
      else {
        p->s.size -= nunits;
 91d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 920:	8b 40 04             	mov    0x4(%eax),%eax
 923:	2b 45 ec             	sub    -0x14(%ebp),%eax
 926:	89 c2                	mov    %eax,%edx
 928:	8b 45 f4             	mov    -0xc(%ebp),%eax
 92b:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 92e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 931:	8b 40 04             	mov    0x4(%eax),%eax
 934:	c1 e0 03             	shl    $0x3,%eax
 937:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 93a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 93d:	8b 55 ec             	mov    -0x14(%ebp),%edx
 940:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 943:	8b 45 f0             	mov    -0x10(%ebp),%eax
 946:	a3 e8 0b 00 00       	mov    %eax,0xbe8
      return (void*)(p + 1);
 94b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 94e:	83 c0 08             	add    $0x8,%eax
 951:	eb 38                	jmp    98b <malloc+0xde>
    }
    if(p == freep)
 953:	a1 e8 0b 00 00       	mov    0xbe8,%eax
 958:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 95b:	75 1b                	jne    978 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 95d:	8b 45 ec             	mov    -0x14(%ebp),%eax
 960:	89 04 24             	mov    %eax,(%esp)
 963:	e8 ed fe ff ff       	call   855 <morecore>
 968:	89 45 f4             	mov    %eax,-0xc(%ebp)
 96b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 96f:	75 07                	jne    978 <malloc+0xcb>
        return 0;
 971:	b8 00 00 00 00       	mov    $0x0,%eax
 976:	eb 13                	jmp    98b <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 978:	8b 45 f4             	mov    -0xc(%ebp),%eax
 97b:	89 45 f0             	mov    %eax,-0x10(%ebp)
 97e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 981:	8b 00                	mov    (%eax),%eax
 983:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 986:	e9 70 ff ff ff       	jmp    8fb <malloc+0x4e>
}
 98b:	c9                   	leave  
 98c:	c3                   	ret    
