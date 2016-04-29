
_waitpid_test:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "traps.h"
#include "memlayout.h"
//#include "defs.h"

int main(void)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 30             	sub    $0x30,%esp
	int* stat_ptr = 0;
   9:	c7 44 24 2c 00 00 00 	movl   $0x0,0x2c(%esp)
  10:	00 
	int status = 1;
  11:	c7 44 24 28 01 00 00 	movl   $0x1,0x28(%esp)
  18:	00 
	int pid = fork();
  19:	e8 0e 03 00 00       	call   32c <fork>
  1e:	89 44 24 24          	mov    %eax,0x24(%esp)
	int exit_pid = 0;
  22:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
  29:	00 

	if (pid == 0) //child
  2a:	83 7c 24 24 00       	cmpl   $0x0,0x24(%esp)
  2f:	75 29                	jne    5a <main+0x5a>
	{
		printf(1, "child pid = %d\n", getpid());
  31:	e8 7e 03 00 00       	call   3b4 <getpid>
  36:	89 44 24 08          	mov    %eax,0x8(%esp)
  3a:	c7 44 24 04 a5 08 00 	movl   $0x8a5,0x4(%esp)
  41:	00 
  42:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  49:	e8 87 04 00 00       	call   4d5 <printf>
		exit_status(status);
  4e:	8b 44 24 28          	mov    0x28(%esp),%eax
  52:	89 04 24             	mov    %eax,(%esp)
  55:	e8 7a 03 00 00       	call   3d4 <exit_status>
	}

	else if (pid > 0)
  5a:	83 7c 24 24 00       	cmpl   $0x0,0x24(%esp)
  5f:	7e 65                	jle    c6 <main+0xc6>
	{
		exit_pid = waitpid(pid + 1, stat_ptr, 0);
  61:	8b 44 24 24          	mov    0x24(%esp),%eax
  65:	8d 50 01             	lea    0x1(%eax),%edx
  68:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  6f:	00 
  70:	8b 44 24 2c          	mov    0x2c(%esp),%eax
  74:	89 44 24 04          	mov    %eax,0x4(%esp)
  78:	89 14 24             	mov    %edx,(%esp)
  7b:	e8 64 03 00 00       	call   3e4 <waitpid>
  80:	89 44 24 20          	mov    %eax,0x20(%esp)
		printf(1, "exited child's pid = %d\n", exit_pid);
  84:	8b 44 24 20          	mov    0x20(%esp),%eax
  88:	89 44 24 08          	mov    %eax,0x8(%esp)
  8c:	c7 44 24 04 b5 08 00 	movl   $0x8b5,0x4(%esp)
  93:	00 
  94:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  9b:	e8 35 04 00 00       	call   4d5 <printf>
		int temp = *stat_ptr;
  a0:	8b 44 24 2c          	mov    0x2c(%esp),%eax
  a4:	8b 00                	mov    (%eax),%eax
  a6:	89 44 24 1c          	mov    %eax,0x1c(%esp)
		printf(1, "exit status of child = %d\n", temp);
  aa:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  ae:	89 44 24 08          	mov    %eax,0x8(%esp)
  b2:	c7 44 24 04 ce 08 00 	movl   $0x8ce,0x4(%esp)
  b9:	00 
  ba:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  c1:	e8 0f 04 00 00       	call   4d5 <printf>
	}
	else
	{
	}
	exit();
  c6:	e8 69 02 00 00       	call   334 <exit>
  cb:	90                   	nop

000000cc <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  cc:	55                   	push   %ebp
  cd:	89 e5                	mov    %esp,%ebp
  cf:	57                   	push   %edi
  d0:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  d1:	8b 4d 08             	mov    0x8(%ebp),%ecx
  d4:	8b 55 10             	mov    0x10(%ebp),%edx
  d7:	8b 45 0c             	mov    0xc(%ebp),%eax
  da:	89 cb                	mov    %ecx,%ebx
  dc:	89 df                	mov    %ebx,%edi
  de:	89 d1                	mov    %edx,%ecx
  e0:	fc                   	cld    
  e1:	f3 aa                	rep stos %al,%es:(%edi)
  e3:	89 ca                	mov    %ecx,%edx
  e5:	89 fb                	mov    %edi,%ebx
  e7:	89 5d 08             	mov    %ebx,0x8(%ebp)
  ea:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  ed:	5b                   	pop    %ebx
  ee:	5f                   	pop    %edi
  ef:	5d                   	pop    %ebp
  f0:	c3                   	ret    

000000f1 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  f1:	55                   	push   %ebp
  f2:	89 e5                	mov    %esp,%ebp
  f4:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  f7:	8b 45 08             	mov    0x8(%ebp),%eax
  fa:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  fd:	90                   	nop
  fe:	8b 45 08             	mov    0x8(%ebp),%eax
 101:	8d 50 01             	lea    0x1(%eax),%edx
 104:	89 55 08             	mov    %edx,0x8(%ebp)
 107:	8b 55 0c             	mov    0xc(%ebp),%edx
 10a:	8d 4a 01             	lea    0x1(%edx),%ecx
 10d:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 110:	0f b6 12             	movzbl (%edx),%edx
 113:	88 10                	mov    %dl,(%eax)
 115:	0f b6 00             	movzbl (%eax),%eax
 118:	84 c0                	test   %al,%al
 11a:	75 e2                	jne    fe <strcpy+0xd>
    ;
  return os;
 11c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 11f:	c9                   	leave  
 120:	c3                   	ret    

00000121 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 121:	55                   	push   %ebp
 122:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 124:	eb 08                	jmp    12e <strcmp+0xd>
    p++, q++;
 126:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 12a:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 12e:	8b 45 08             	mov    0x8(%ebp),%eax
 131:	0f b6 00             	movzbl (%eax),%eax
 134:	84 c0                	test   %al,%al
 136:	74 10                	je     148 <strcmp+0x27>
 138:	8b 45 08             	mov    0x8(%ebp),%eax
 13b:	0f b6 10             	movzbl (%eax),%edx
 13e:	8b 45 0c             	mov    0xc(%ebp),%eax
 141:	0f b6 00             	movzbl (%eax),%eax
 144:	38 c2                	cmp    %al,%dl
 146:	74 de                	je     126 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 148:	8b 45 08             	mov    0x8(%ebp),%eax
 14b:	0f b6 00             	movzbl (%eax),%eax
 14e:	0f b6 d0             	movzbl %al,%edx
 151:	8b 45 0c             	mov    0xc(%ebp),%eax
 154:	0f b6 00             	movzbl (%eax),%eax
 157:	0f b6 c0             	movzbl %al,%eax
 15a:	29 c2                	sub    %eax,%edx
 15c:	89 d0                	mov    %edx,%eax
}
 15e:	5d                   	pop    %ebp
 15f:	c3                   	ret    

00000160 <strlen>:

uint
strlen(char *s)
{
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
 163:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 166:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 16d:	eb 04                	jmp    173 <strlen+0x13>
 16f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 173:	8b 55 fc             	mov    -0x4(%ebp),%edx
 176:	8b 45 08             	mov    0x8(%ebp),%eax
 179:	01 d0                	add    %edx,%eax
 17b:	0f b6 00             	movzbl (%eax),%eax
 17e:	84 c0                	test   %al,%al
 180:	75 ed                	jne    16f <strlen+0xf>
    ;
  return n;
 182:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 185:	c9                   	leave  
 186:	c3                   	ret    

00000187 <memset>:

void*
memset(void *dst, int c, uint n)
{
 187:	55                   	push   %ebp
 188:	89 e5                	mov    %esp,%ebp
 18a:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 18d:	8b 45 10             	mov    0x10(%ebp),%eax
 190:	89 44 24 08          	mov    %eax,0x8(%esp)
 194:	8b 45 0c             	mov    0xc(%ebp),%eax
 197:	89 44 24 04          	mov    %eax,0x4(%esp)
 19b:	8b 45 08             	mov    0x8(%ebp),%eax
 19e:	89 04 24             	mov    %eax,(%esp)
 1a1:	e8 26 ff ff ff       	call   cc <stosb>
  return dst;
 1a6:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1a9:	c9                   	leave  
 1aa:	c3                   	ret    

000001ab <strchr>:

char*
strchr(const char *s, char c)
{
 1ab:	55                   	push   %ebp
 1ac:	89 e5                	mov    %esp,%ebp
 1ae:	83 ec 04             	sub    $0x4,%esp
 1b1:	8b 45 0c             	mov    0xc(%ebp),%eax
 1b4:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 1b7:	eb 14                	jmp    1cd <strchr+0x22>
    if(*s == c)
 1b9:	8b 45 08             	mov    0x8(%ebp),%eax
 1bc:	0f b6 00             	movzbl (%eax),%eax
 1bf:	3a 45 fc             	cmp    -0x4(%ebp),%al
 1c2:	75 05                	jne    1c9 <strchr+0x1e>
      return (char*)s;
 1c4:	8b 45 08             	mov    0x8(%ebp),%eax
 1c7:	eb 13                	jmp    1dc <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 1c9:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 1cd:	8b 45 08             	mov    0x8(%ebp),%eax
 1d0:	0f b6 00             	movzbl (%eax),%eax
 1d3:	84 c0                	test   %al,%al
 1d5:	75 e2                	jne    1b9 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 1d7:	b8 00 00 00 00       	mov    $0x0,%eax
}
 1dc:	c9                   	leave  
 1dd:	c3                   	ret    

000001de <gets>:

char*
gets(char *buf, int max)
{
 1de:	55                   	push   %ebp
 1df:	89 e5                	mov    %esp,%ebp
 1e1:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1e4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 1eb:	eb 4c                	jmp    239 <gets+0x5b>
    cc = read(0, &c, 1);
 1ed:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 1f4:	00 
 1f5:	8d 45 ef             	lea    -0x11(%ebp),%eax
 1f8:	89 44 24 04          	mov    %eax,0x4(%esp)
 1fc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 203:	e8 44 01 00 00       	call   34c <read>
 208:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 20b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 20f:	7f 02                	jg     213 <gets+0x35>
      break;
 211:	eb 31                	jmp    244 <gets+0x66>
    buf[i++] = c;
 213:	8b 45 f4             	mov    -0xc(%ebp),%eax
 216:	8d 50 01             	lea    0x1(%eax),%edx
 219:	89 55 f4             	mov    %edx,-0xc(%ebp)
 21c:	89 c2                	mov    %eax,%edx
 21e:	8b 45 08             	mov    0x8(%ebp),%eax
 221:	01 c2                	add    %eax,%edx
 223:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 227:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 229:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 22d:	3c 0a                	cmp    $0xa,%al
 22f:	74 13                	je     244 <gets+0x66>
 231:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 235:	3c 0d                	cmp    $0xd,%al
 237:	74 0b                	je     244 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 239:	8b 45 f4             	mov    -0xc(%ebp),%eax
 23c:	83 c0 01             	add    $0x1,%eax
 23f:	3b 45 0c             	cmp    0xc(%ebp),%eax
 242:	7c a9                	jl     1ed <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 244:	8b 55 f4             	mov    -0xc(%ebp),%edx
 247:	8b 45 08             	mov    0x8(%ebp),%eax
 24a:	01 d0                	add    %edx,%eax
 24c:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 24f:	8b 45 08             	mov    0x8(%ebp),%eax
}
 252:	c9                   	leave  
 253:	c3                   	ret    

00000254 <stat>:

int
stat(char *n, struct stat *st)
{
 254:	55                   	push   %ebp
 255:	89 e5                	mov    %esp,%ebp
 257:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 25a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 261:	00 
 262:	8b 45 08             	mov    0x8(%ebp),%eax
 265:	89 04 24             	mov    %eax,(%esp)
 268:	e8 07 01 00 00       	call   374 <open>
 26d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 270:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 274:	79 07                	jns    27d <stat+0x29>
    return -1;
 276:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 27b:	eb 23                	jmp    2a0 <stat+0x4c>
  r = fstat(fd, st);
 27d:	8b 45 0c             	mov    0xc(%ebp),%eax
 280:	89 44 24 04          	mov    %eax,0x4(%esp)
 284:	8b 45 f4             	mov    -0xc(%ebp),%eax
 287:	89 04 24             	mov    %eax,(%esp)
 28a:	e8 fd 00 00 00       	call   38c <fstat>
 28f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 292:	8b 45 f4             	mov    -0xc(%ebp),%eax
 295:	89 04 24             	mov    %eax,(%esp)
 298:	e8 bf 00 00 00       	call   35c <close>
  return r;
 29d:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 2a0:	c9                   	leave  
 2a1:	c3                   	ret    

000002a2 <atoi>:

int
atoi(const char *s)
{
 2a2:	55                   	push   %ebp
 2a3:	89 e5                	mov    %esp,%ebp
 2a5:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 2a8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 2af:	eb 25                	jmp    2d6 <atoi+0x34>
    n = n*10 + *s++ - '0';
 2b1:	8b 55 fc             	mov    -0x4(%ebp),%edx
 2b4:	89 d0                	mov    %edx,%eax
 2b6:	c1 e0 02             	shl    $0x2,%eax
 2b9:	01 d0                	add    %edx,%eax
 2bb:	01 c0                	add    %eax,%eax
 2bd:	89 c1                	mov    %eax,%ecx
 2bf:	8b 45 08             	mov    0x8(%ebp),%eax
 2c2:	8d 50 01             	lea    0x1(%eax),%edx
 2c5:	89 55 08             	mov    %edx,0x8(%ebp)
 2c8:	0f b6 00             	movzbl (%eax),%eax
 2cb:	0f be c0             	movsbl %al,%eax
 2ce:	01 c8                	add    %ecx,%eax
 2d0:	83 e8 30             	sub    $0x30,%eax
 2d3:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2d6:	8b 45 08             	mov    0x8(%ebp),%eax
 2d9:	0f b6 00             	movzbl (%eax),%eax
 2dc:	3c 2f                	cmp    $0x2f,%al
 2de:	7e 0a                	jle    2ea <atoi+0x48>
 2e0:	8b 45 08             	mov    0x8(%ebp),%eax
 2e3:	0f b6 00             	movzbl (%eax),%eax
 2e6:	3c 39                	cmp    $0x39,%al
 2e8:	7e c7                	jle    2b1 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 2ea:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 2ed:	c9                   	leave  
 2ee:	c3                   	ret    

000002ef <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 2ef:	55                   	push   %ebp
 2f0:	89 e5                	mov    %esp,%ebp
 2f2:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 2f5:	8b 45 08             	mov    0x8(%ebp),%eax
 2f8:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 2fb:	8b 45 0c             	mov    0xc(%ebp),%eax
 2fe:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 301:	eb 17                	jmp    31a <memmove+0x2b>
    *dst++ = *src++;
 303:	8b 45 fc             	mov    -0x4(%ebp),%eax
 306:	8d 50 01             	lea    0x1(%eax),%edx
 309:	89 55 fc             	mov    %edx,-0x4(%ebp)
 30c:	8b 55 f8             	mov    -0x8(%ebp),%edx
 30f:	8d 4a 01             	lea    0x1(%edx),%ecx
 312:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 315:	0f b6 12             	movzbl (%edx),%edx
 318:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 31a:	8b 45 10             	mov    0x10(%ebp),%eax
 31d:	8d 50 ff             	lea    -0x1(%eax),%edx
 320:	89 55 10             	mov    %edx,0x10(%ebp)
 323:	85 c0                	test   %eax,%eax
 325:	7f dc                	jg     303 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 327:	8b 45 08             	mov    0x8(%ebp),%eax
}
 32a:	c9                   	leave  
 32b:	c3                   	ret    

0000032c <fork>:
 32c:	b8 01 00 00 00       	mov    $0x1,%eax
 331:	cd 40                	int    $0x40
 333:	c3                   	ret    

00000334 <exit>:
 334:	b8 02 00 00 00       	mov    $0x2,%eax
 339:	cd 40                	int    $0x40
 33b:	c3                   	ret    

0000033c <wait>:
 33c:	b8 03 00 00 00       	mov    $0x3,%eax
 341:	cd 40                	int    $0x40
 343:	c3                   	ret    

00000344 <pipe>:
 344:	b8 04 00 00 00       	mov    $0x4,%eax
 349:	cd 40                	int    $0x40
 34b:	c3                   	ret    

0000034c <read>:
 34c:	b8 05 00 00 00       	mov    $0x5,%eax
 351:	cd 40                	int    $0x40
 353:	c3                   	ret    

00000354 <write>:
 354:	b8 10 00 00 00       	mov    $0x10,%eax
 359:	cd 40                	int    $0x40
 35b:	c3                   	ret    

0000035c <close>:
 35c:	b8 15 00 00 00       	mov    $0x15,%eax
 361:	cd 40                	int    $0x40
 363:	c3                   	ret    

00000364 <kill>:
 364:	b8 06 00 00 00       	mov    $0x6,%eax
 369:	cd 40                	int    $0x40
 36b:	c3                   	ret    

0000036c <exec>:
 36c:	b8 07 00 00 00       	mov    $0x7,%eax
 371:	cd 40                	int    $0x40
 373:	c3                   	ret    

00000374 <open>:
 374:	b8 0f 00 00 00       	mov    $0xf,%eax
 379:	cd 40                	int    $0x40
 37b:	c3                   	ret    

0000037c <mknod>:
 37c:	b8 11 00 00 00       	mov    $0x11,%eax
 381:	cd 40                	int    $0x40
 383:	c3                   	ret    

00000384 <unlink>:
 384:	b8 12 00 00 00       	mov    $0x12,%eax
 389:	cd 40                	int    $0x40
 38b:	c3                   	ret    

0000038c <fstat>:
 38c:	b8 08 00 00 00       	mov    $0x8,%eax
 391:	cd 40                	int    $0x40
 393:	c3                   	ret    

00000394 <link>:
 394:	b8 13 00 00 00       	mov    $0x13,%eax
 399:	cd 40                	int    $0x40
 39b:	c3                   	ret    

0000039c <mkdir>:
 39c:	b8 14 00 00 00       	mov    $0x14,%eax
 3a1:	cd 40                	int    $0x40
 3a3:	c3                   	ret    

000003a4 <chdir>:
 3a4:	b8 09 00 00 00       	mov    $0x9,%eax
 3a9:	cd 40                	int    $0x40
 3ab:	c3                   	ret    

000003ac <dup>:
 3ac:	b8 0a 00 00 00       	mov    $0xa,%eax
 3b1:	cd 40                	int    $0x40
 3b3:	c3                   	ret    

000003b4 <getpid>:
 3b4:	b8 0b 00 00 00       	mov    $0xb,%eax
 3b9:	cd 40                	int    $0x40
 3bb:	c3                   	ret    

000003bc <sbrk>:
 3bc:	b8 0c 00 00 00       	mov    $0xc,%eax
 3c1:	cd 40                	int    $0x40
 3c3:	c3                   	ret    

000003c4 <sleep>:
 3c4:	b8 0d 00 00 00       	mov    $0xd,%eax
 3c9:	cd 40                	int    $0x40
 3cb:	c3                   	ret    

000003cc <uptime>:
 3cc:	b8 0e 00 00 00       	mov    $0xe,%eax
 3d1:	cd 40                	int    $0x40
 3d3:	c3                   	ret    

000003d4 <exit_status>:
 3d4:	b8 16 00 00 00       	mov    $0x16,%eax
 3d9:	cd 40                	int    $0x40
 3db:	c3                   	ret    

000003dc <wait_status>:
 3dc:	b8 17 00 00 00       	mov    $0x17,%eax
 3e1:	cd 40                	int    $0x40
 3e3:	c3                   	ret    

000003e4 <waitpid>:
 3e4:	b8 18 00 00 00       	mov    $0x18,%eax
 3e9:	cd 40                	int    $0x40
 3eb:	c3                   	ret    

000003ec <change_priority>:
 3ec:	b8 19 00 00 00       	mov    $0x19,%eax
 3f1:	cd 40                	int    $0x40
 3f3:	c3                   	ret    

000003f4 <set_priority>:
 3f4:	b8 1a 00 00 00       	mov    $0x1a,%eax
 3f9:	cd 40                	int    $0x40
 3fb:	c3                   	ret    

000003fc <putc>:
 3fc:	55                   	push   %ebp
 3fd:	89 e5                	mov    %esp,%ebp
 3ff:	83 ec 28             	sub    $0x28,%esp
 402:	8b 45 0c             	mov    0xc(%ebp),%eax
 405:	88 45 f4             	mov    %al,-0xc(%ebp)
 408:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 40f:	00 
 410:	8d 45 f4             	lea    -0xc(%ebp),%eax
 413:	89 44 24 04          	mov    %eax,0x4(%esp)
 417:	8b 45 08             	mov    0x8(%ebp),%eax
 41a:	89 04 24             	mov    %eax,(%esp)
 41d:	e8 32 ff ff ff       	call   354 <write>
 422:	c9                   	leave  
 423:	c3                   	ret    

00000424 <printint>:
 424:	55                   	push   %ebp
 425:	89 e5                	mov    %esp,%ebp
 427:	53                   	push   %ebx
 428:	83 ec 44             	sub    $0x44,%esp
 42b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 432:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 436:	74 17                	je     44f <printint+0x2b>
 438:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 43c:	79 11                	jns    44f <printint+0x2b>
 43e:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
 445:	8b 45 0c             	mov    0xc(%ebp),%eax
 448:	f7 d8                	neg    %eax
 44a:	89 45 f4             	mov    %eax,-0xc(%ebp)
 44d:	eb 06                	jmp    455 <printint+0x31>
 44f:	8b 45 0c             	mov    0xc(%ebp),%eax
 452:	89 45 f4             	mov    %eax,-0xc(%ebp)
 455:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 45c:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 45f:	8b 5d 10             	mov    0x10(%ebp),%ebx
 462:	8b 45 f4             	mov    -0xc(%ebp),%eax
 465:	ba 00 00 00 00       	mov    $0x0,%edx
 46a:	f7 f3                	div    %ebx
 46c:	89 d0                	mov    %edx,%eax
 46e:	0f b6 80 cc 0a 00 00 	movzbl 0xacc(%eax),%eax
 475:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 479:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 47d:	8b 45 10             	mov    0x10(%ebp),%eax
 480:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 483:	8b 45 f4             	mov    -0xc(%ebp),%eax
 486:	ba 00 00 00 00       	mov    $0x0,%edx
 48b:	f7 75 d4             	divl   -0x2c(%ebp)
 48e:	89 45 f4             	mov    %eax,-0xc(%ebp)
 491:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 495:	75 c5                	jne    45c <printint+0x38>
 497:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 49b:	74 28                	je     4c5 <printint+0xa1>
 49d:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4a0:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 4a5:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 4a9:	eb 1a                	jmp    4c5 <printint+0xa1>
 4ab:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4ae:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
 4b3:	0f be c0             	movsbl %al,%eax
 4b6:	89 44 24 04          	mov    %eax,0x4(%esp)
 4ba:	8b 45 08             	mov    0x8(%ebp),%eax
 4bd:	89 04 24             	mov    %eax,(%esp)
 4c0:	e8 37 ff ff ff       	call   3fc <putc>
 4c5:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
 4c9:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4cd:	79 dc                	jns    4ab <printint+0x87>
 4cf:	83 c4 44             	add    $0x44,%esp
 4d2:	5b                   	pop    %ebx
 4d3:	5d                   	pop    %ebp
 4d4:	c3                   	ret    

000004d5 <printf>:
 4d5:	55                   	push   %ebp
 4d6:	89 e5                	mov    %esp,%ebp
 4d8:	83 ec 38             	sub    $0x38,%esp
 4db:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 4e2:	8d 45 0c             	lea    0xc(%ebp),%eax
 4e5:	83 c0 04             	add    $0x4,%eax
 4e8:	89 45 f4             	mov    %eax,-0xc(%ebp)
 4eb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 4f2:	e9 7e 01 00 00       	jmp    675 <printf+0x1a0>
 4f7:	8b 55 0c             	mov    0xc(%ebp),%edx
 4fa:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4fd:	8d 04 02             	lea    (%edx,%eax,1),%eax
 500:	0f b6 00             	movzbl (%eax),%eax
 503:	0f be c0             	movsbl %al,%eax
 506:	25 ff 00 00 00       	and    $0xff,%eax
 50b:	89 45 e8             	mov    %eax,-0x18(%ebp)
 50e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 512:	75 2c                	jne    540 <printf+0x6b>
 514:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 518:	75 0c                	jne    526 <printf+0x51>
 51a:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
 521:	e9 4b 01 00 00       	jmp    671 <printf+0x19c>
 526:	8b 45 e8             	mov    -0x18(%ebp),%eax
 529:	0f be c0             	movsbl %al,%eax
 52c:	89 44 24 04          	mov    %eax,0x4(%esp)
 530:	8b 45 08             	mov    0x8(%ebp),%eax
 533:	89 04 24             	mov    %eax,(%esp)
 536:	e8 c1 fe ff ff       	call   3fc <putc>
 53b:	e9 31 01 00 00       	jmp    671 <printf+0x19c>
 540:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
 544:	0f 85 27 01 00 00    	jne    671 <printf+0x19c>
 54a:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
 54e:	75 2d                	jne    57d <printf+0xa8>
 550:	8b 45 f4             	mov    -0xc(%ebp),%eax
 553:	8b 00                	mov    (%eax),%eax
 555:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 55c:	00 
 55d:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 564:	00 
 565:	89 44 24 04          	mov    %eax,0x4(%esp)
 569:	8b 45 08             	mov    0x8(%ebp),%eax
 56c:	89 04 24             	mov    %eax,(%esp)
 56f:	e8 b0 fe ff ff       	call   424 <printint>
 574:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 578:	e9 ed 00 00 00       	jmp    66a <printf+0x195>
 57d:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
 581:	74 06                	je     589 <printf+0xb4>
 583:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
 587:	75 2d                	jne    5b6 <printf+0xe1>
 589:	8b 45 f4             	mov    -0xc(%ebp),%eax
 58c:	8b 00                	mov    (%eax),%eax
 58e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 595:	00 
 596:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 59d:	00 
 59e:	89 44 24 04          	mov    %eax,0x4(%esp)
 5a2:	8b 45 08             	mov    0x8(%ebp),%eax
 5a5:	89 04 24             	mov    %eax,(%esp)
 5a8:	e8 77 fe ff ff       	call   424 <printint>
 5ad:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 5b1:	e9 b4 00 00 00       	jmp    66a <printf+0x195>
 5b6:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
 5ba:	75 46                	jne    602 <printf+0x12d>
 5bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5bf:	8b 00                	mov    (%eax),%eax
 5c1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 5c4:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 5c8:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 5cc:	75 27                	jne    5f5 <printf+0x120>
 5ce:	c7 45 e4 e9 08 00 00 	movl   $0x8e9,-0x1c(%ebp)
 5d5:	eb 1f                	jmp    5f6 <printf+0x121>
 5d7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5da:	0f b6 00             	movzbl (%eax),%eax
 5dd:	0f be c0             	movsbl %al,%eax
 5e0:	89 44 24 04          	mov    %eax,0x4(%esp)
 5e4:	8b 45 08             	mov    0x8(%ebp),%eax
 5e7:	89 04 24             	mov    %eax,(%esp)
 5ea:	e8 0d fe ff ff       	call   3fc <putc>
 5ef:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 5f3:	eb 01                	jmp    5f6 <printf+0x121>
 5f5:	90                   	nop
 5f6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5f9:	0f b6 00             	movzbl (%eax),%eax
 5fc:	84 c0                	test   %al,%al
 5fe:	75 d7                	jne    5d7 <printf+0x102>
 600:	eb 68                	jmp    66a <printf+0x195>
 602:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
 606:	75 1d                	jne    625 <printf+0x150>
 608:	8b 45 f4             	mov    -0xc(%ebp),%eax
 60b:	8b 00                	mov    (%eax),%eax
 60d:	0f be c0             	movsbl %al,%eax
 610:	89 44 24 04          	mov    %eax,0x4(%esp)
 614:	8b 45 08             	mov    0x8(%ebp),%eax
 617:	89 04 24             	mov    %eax,(%esp)
 61a:	e8 dd fd ff ff       	call   3fc <putc>
 61f:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 623:	eb 45                	jmp    66a <printf+0x195>
 625:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 629:	75 17                	jne    642 <printf+0x16d>
 62b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 62e:	0f be c0             	movsbl %al,%eax
 631:	89 44 24 04          	mov    %eax,0x4(%esp)
 635:	8b 45 08             	mov    0x8(%ebp),%eax
 638:	89 04 24             	mov    %eax,(%esp)
 63b:	e8 bc fd ff ff       	call   3fc <putc>
 640:	eb 28                	jmp    66a <printf+0x195>
 642:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 649:	00 
 64a:	8b 45 08             	mov    0x8(%ebp),%eax
 64d:	89 04 24             	mov    %eax,(%esp)
 650:	e8 a7 fd ff ff       	call   3fc <putc>
 655:	8b 45 e8             	mov    -0x18(%ebp),%eax
 658:	0f be c0             	movsbl %al,%eax
 65b:	89 44 24 04          	mov    %eax,0x4(%esp)
 65f:	8b 45 08             	mov    0x8(%ebp),%eax
 662:	89 04 24             	mov    %eax,(%esp)
 665:	e8 92 fd ff ff       	call   3fc <putc>
 66a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 671:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 675:	8b 55 0c             	mov    0xc(%ebp),%edx
 678:	8b 45 ec             	mov    -0x14(%ebp),%eax
 67b:	8d 04 02             	lea    (%edx,%eax,1),%eax
 67e:	0f b6 00             	movzbl (%eax),%eax
 681:	84 c0                	test   %al,%al
 683:	0f 85 6e fe ff ff    	jne    4f7 <printf+0x22>
 689:	c9                   	leave  
 68a:	c3                   	ret    
 68b:	90                   	nop

0000068c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 68c:	55                   	push   %ebp
 68d:	89 e5                	mov    %esp,%ebp
 68f:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 692:	8b 45 08             	mov    0x8(%ebp),%eax
 695:	83 e8 08             	sub    $0x8,%eax
 698:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 69b:	a1 e8 0a 00 00       	mov    0xae8,%eax
 6a0:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6a3:	eb 24                	jmp    6c9 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6a5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a8:	8b 00                	mov    (%eax),%eax
 6aa:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6ad:	77 12                	ja     6c1 <free+0x35>
 6af:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6b2:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6b5:	77 24                	ja     6db <free+0x4f>
 6b7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ba:	8b 00                	mov    (%eax),%eax
 6bc:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6bf:	77 1a                	ja     6db <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6c1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6c4:	8b 00                	mov    (%eax),%eax
 6c6:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6c9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6cc:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6cf:	76 d4                	jbe    6a5 <free+0x19>
 6d1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d4:	8b 00                	mov    (%eax),%eax
 6d6:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6d9:	76 ca                	jbe    6a5 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 6db:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6de:	8b 40 04             	mov    0x4(%eax),%eax
 6e1:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 6e8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6eb:	01 c2                	add    %eax,%edx
 6ed:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6f0:	8b 00                	mov    (%eax),%eax
 6f2:	39 c2                	cmp    %eax,%edx
 6f4:	75 24                	jne    71a <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 6f6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6f9:	8b 50 04             	mov    0x4(%eax),%edx
 6fc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ff:	8b 00                	mov    (%eax),%eax
 701:	8b 40 04             	mov    0x4(%eax),%eax
 704:	01 c2                	add    %eax,%edx
 706:	8b 45 f8             	mov    -0x8(%ebp),%eax
 709:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 70c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 70f:	8b 00                	mov    (%eax),%eax
 711:	8b 10                	mov    (%eax),%edx
 713:	8b 45 f8             	mov    -0x8(%ebp),%eax
 716:	89 10                	mov    %edx,(%eax)
 718:	eb 0a                	jmp    724 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 71a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 71d:	8b 10                	mov    (%eax),%edx
 71f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 722:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 724:	8b 45 fc             	mov    -0x4(%ebp),%eax
 727:	8b 40 04             	mov    0x4(%eax),%eax
 72a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 731:	8b 45 fc             	mov    -0x4(%ebp),%eax
 734:	01 d0                	add    %edx,%eax
 736:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 739:	75 20                	jne    75b <free+0xcf>
    p->s.size += bp->s.size;
 73b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 73e:	8b 50 04             	mov    0x4(%eax),%edx
 741:	8b 45 f8             	mov    -0x8(%ebp),%eax
 744:	8b 40 04             	mov    0x4(%eax),%eax
 747:	01 c2                	add    %eax,%edx
 749:	8b 45 fc             	mov    -0x4(%ebp),%eax
 74c:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 74f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 752:	8b 10                	mov    (%eax),%edx
 754:	8b 45 fc             	mov    -0x4(%ebp),%eax
 757:	89 10                	mov    %edx,(%eax)
 759:	eb 08                	jmp    763 <free+0xd7>
  } else
    p->s.ptr = bp;
 75b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 75e:	8b 55 f8             	mov    -0x8(%ebp),%edx
 761:	89 10                	mov    %edx,(%eax)
  freep = p;
 763:	8b 45 fc             	mov    -0x4(%ebp),%eax
 766:	a3 e8 0a 00 00       	mov    %eax,0xae8
}
 76b:	c9                   	leave  
 76c:	c3                   	ret    

0000076d <morecore>:

static Header*
morecore(uint nu)
{
 76d:	55                   	push   %ebp
 76e:	89 e5                	mov    %esp,%ebp
 770:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 773:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 77a:	77 07                	ja     783 <morecore+0x16>
    nu = 4096;
 77c:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 783:	8b 45 08             	mov    0x8(%ebp),%eax
 786:	c1 e0 03             	shl    $0x3,%eax
 789:	89 04 24             	mov    %eax,(%esp)
 78c:	e8 2b fc ff ff       	call   3bc <sbrk>
 791:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 794:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 798:	75 07                	jne    7a1 <morecore+0x34>
    return 0;
 79a:	b8 00 00 00 00       	mov    $0x0,%eax
 79f:	eb 22                	jmp    7c3 <morecore+0x56>
  hp = (Header*)p;
 7a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7a4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 7a7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7aa:	8b 55 08             	mov    0x8(%ebp),%edx
 7ad:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 7b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7b3:	83 c0 08             	add    $0x8,%eax
 7b6:	89 04 24             	mov    %eax,(%esp)
 7b9:	e8 ce fe ff ff       	call   68c <free>
  return freep;
 7be:	a1 e8 0a 00 00       	mov    0xae8,%eax
}
 7c3:	c9                   	leave  
 7c4:	c3                   	ret    

000007c5 <malloc>:

void*
malloc(uint nbytes)
{
 7c5:	55                   	push   %ebp
 7c6:	89 e5                	mov    %esp,%ebp
 7c8:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7cb:	8b 45 08             	mov    0x8(%ebp),%eax
 7ce:	83 c0 07             	add    $0x7,%eax
 7d1:	c1 e8 03             	shr    $0x3,%eax
 7d4:	83 c0 01             	add    $0x1,%eax
 7d7:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 7da:	a1 e8 0a 00 00       	mov    0xae8,%eax
 7df:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7e2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 7e6:	75 23                	jne    80b <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 7e8:	c7 45 f0 e0 0a 00 00 	movl   $0xae0,-0x10(%ebp)
 7ef:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7f2:	a3 e8 0a 00 00       	mov    %eax,0xae8
 7f7:	a1 e8 0a 00 00       	mov    0xae8,%eax
 7fc:	a3 e0 0a 00 00       	mov    %eax,0xae0
    base.s.size = 0;
 801:	c7 05 e4 0a 00 00 00 	movl   $0x0,0xae4
 808:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 80b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80e:	8b 00                	mov    (%eax),%eax
 810:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 813:	8b 45 f4             	mov    -0xc(%ebp),%eax
 816:	8b 40 04             	mov    0x4(%eax),%eax
 819:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 81c:	72 4d                	jb     86b <malloc+0xa6>
      if(p->s.size == nunits)
 81e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 821:	8b 40 04             	mov    0x4(%eax),%eax
 824:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 827:	75 0c                	jne    835 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 829:	8b 45 f4             	mov    -0xc(%ebp),%eax
 82c:	8b 10                	mov    (%eax),%edx
 82e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 831:	89 10                	mov    %edx,(%eax)
 833:	eb 26                	jmp    85b <malloc+0x96>
      else {
        p->s.size -= nunits;
 835:	8b 45 f4             	mov    -0xc(%ebp),%eax
 838:	8b 40 04             	mov    0x4(%eax),%eax
 83b:	2b 45 ec             	sub    -0x14(%ebp),%eax
 83e:	89 c2                	mov    %eax,%edx
 840:	8b 45 f4             	mov    -0xc(%ebp),%eax
 843:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 846:	8b 45 f4             	mov    -0xc(%ebp),%eax
 849:	8b 40 04             	mov    0x4(%eax),%eax
 84c:	c1 e0 03             	shl    $0x3,%eax
 84f:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 852:	8b 45 f4             	mov    -0xc(%ebp),%eax
 855:	8b 55 ec             	mov    -0x14(%ebp),%edx
 858:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 85b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 85e:	a3 e8 0a 00 00       	mov    %eax,0xae8
      return (void*)(p + 1);
 863:	8b 45 f4             	mov    -0xc(%ebp),%eax
 866:	83 c0 08             	add    $0x8,%eax
 869:	eb 38                	jmp    8a3 <malloc+0xde>
    }
    if(p == freep)
 86b:	a1 e8 0a 00 00       	mov    0xae8,%eax
 870:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 873:	75 1b                	jne    890 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 875:	8b 45 ec             	mov    -0x14(%ebp),%eax
 878:	89 04 24             	mov    %eax,(%esp)
 87b:	e8 ed fe ff ff       	call   76d <morecore>
 880:	89 45 f4             	mov    %eax,-0xc(%ebp)
 883:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 887:	75 07                	jne    890 <malloc+0xcb>
        return 0;
 889:	b8 00 00 00 00       	mov    $0x0,%eax
 88e:	eb 13                	jmp    8a3 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 890:	8b 45 f4             	mov    -0xc(%ebp),%eax
 893:	89 45 f0             	mov    %eax,-0x10(%ebp)
 896:	8b 45 f4             	mov    -0xc(%ebp),%eax
 899:	8b 00                	mov    (%eax),%eax
 89b:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 89e:	e9 70 ff ff ff       	jmp    813 <malloc+0x4e>
}
 8a3:	c9                   	leave  
 8a4:	c3                   	ret    
