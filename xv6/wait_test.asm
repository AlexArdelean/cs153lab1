
_wait_test:     file format elf32-i386


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
  19:	e8 fa 02 00 00       	call   318 <fork>
  1e:	89 44 24 24          	mov    %eax,0x24(%esp)
	int exit_pid = 0;
  22:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
  29:	00 

	if (pid == 0) //child
  2a:	83 7c 24 24 00       	cmpl   $0x0,0x24(%esp)
  2f:	75 29                	jne    5a <main+0x5a>
	{
		printf(1, "child pid = %d\n", getpid());
  31:	e8 6a 03 00 00       	call   3a0 <getpid>
  36:	89 44 24 08          	mov    %eax,0x8(%esp)
  3a:	c7 44 24 04 91 08 00 	movl   $0x891,0x4(%esp)
  41:	00 
  42:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  49:	e8 73 04 00 00       	call   4c1 <printf>
		exit_status(status);
  4e:	8b 44 24 28          	mov    0x28(%esp),%eax
  52:	89 04 24             	mov    %eax,(%esp)
  55:	e8 66 03 00 00       	call   3c0 <exit_status>
	}

	else if (pid > 0)
  5a:	83 7c 24 24 00       	cmpl   $0x0,0x24(%esp)
  5f:	7e 52                	jle    b3 <main+0xb3>
	{
		exit_pid = wait_status(stat_ptr);
  61:	8b 44 24 2c          	mov    0x2c(%esp),%eax
  65:	89 04 24             	mov    %eax,(%esp)
  68:	e8 5b 03 00 00       	call   3c8 <wait_status>
  6d:	89 44 24 20          	mov    %eax,0x20(%esp)
		printf(1, "exited child's pid = %d\n", exit_pid);
  71:	8b 44 24 20          	mov    0x20(%esp),%eax
  75:	89 44 24 08          	mov    %eax,0x8(%esp)
  79:	c7 44 24 04 a1 08 00 	movl   $0x8a1,0x4(%esp)
  80:	00 
  81:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  88:	e8 34 04 00 00       	call   4c1 <printf>
		int temp = *stat_ptr;
  8d:	8b 44 24 2c          	mov    0x2c(%esp),%eax
  91:	8b 00                	mov    (%eax),%eax
  93:	89 44 24 1c          	mov    %eax,0x1c(%esp)
		printf(1, "exit status of child = %d\n", temp);
  97:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  9b:	89 44 24 08          	mov    %eax,0x8(%esp)
  9f:	c7 44 24 04 ba 08 00 	movl   $0x8ba,0x4(%esp)
  a6:	00 
  a7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  ae:	e8 0e 04 00 00       	call   4c1 <printf>
	}
	else
	{
	}
	exit();
  b3:	e8 68 02 00 00       	call   320 <exit>

000000b8 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  b8:	55                   	push   %ebp
  b9:	89 e5                	mov    %esp,%ebp
  bb:	57                   	push   %edi
  bc:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  bd:	8b 4d 08             	mov    0x8(%ebp),%ecx
  c0:	8b 55 10             	mov    0x10(%ebp),%edx
  c3:	8b 45 0c             	mov    0xc(%ebp),%eax
  c6:	89 cb                	mov    %ecx,%ebx
  c8:	89 df                	mov    %ebx,%edi
  ca:	89 d1                	mov    %edx,%ecx
  cc:	fc                   	cld    
  cd:	f3 aa                	rep stos %al,%es:(%edi)
  cf:	89 ca                	mov    %ecx,%edx
  d1:	89 fb                	mov    %edi,%ebx
  d3:	89 5d 08             	mov    %ebx,0x8(%ebp)
  d6:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  d9:	5b                   	pop    %ebx
  da:	5f                   	pop    %edi
  db:	5d                   	pop    %ebp
  dc:	c3                   	ret    

000000dd <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  dd:	55                   	push   %ebp
  de:	89 e5                	mov    %esp,%ebp
  e0:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  e3:	8b 45 08             	mov    0x8(%ebp),%eax
  e6:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  e9:	90                   	nop
  ea:	8b 45 08             	mov    0x8(%ebp),%eax
  ed:	8d 50 01             	lea    0x1(%eax),%edx
  f0:	89 55 08             	mov    %edx,0x8(%ebp)
  f3:	8b 55 0c             	mov    0xc(%ebp),%edx
  f6:	8d 4a 01             	lea    0x1(%edx),%ecx
  f9:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  fc:	0f b6 12             	movzbl (%edx),%edx
  ff:	88 10                	mov    %dl,(%eax)
 101:	0f b6 00             	movzbl (%eax),%eax
 104:	84 c0                	test   %al,%al
 106:	75 e2                	jne    ea <strcpy+0xd>
    ;
  return os;
 108:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 10b:	c9                   	leave  
 10c:	c3                   	ret    

0000010d <strcmp>:

int
strcmp(const char *p, const char *q)
{
 10d:	55                   	push   %ebp
 10e:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 110:	eb 08                	jmp    11a <strcmp+0xd>
    p++, q++;
 112:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 116:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 11a:	8b 45 08             	mov    0x8(%ebp),%eax
 11d:	0f b6 00             	movzbl (%eax),%eax
 120:	84 c0                	test   %al,%al
 122:	74 10                	je     134 <strcmp+0x27>
 124:	8b 45 08             	mov    0x8(%ebp),%eax
 127:	0f b6 10             	movzbl (%eax),%edx
 12a:	8b 45 0c             	mov    0xc(%ebp),%eax
 12d:	0f b6 00             	movzbl (%eax),%eax
 130:	38 c2                	cmp    %al,%dl
 132:	74 de                	je     112 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 134:	8b 45 08             	mov    0x8(%ebp),%eax
 137:	0f b6 00             	movzbl (%eax),%eax
 13a:	0f b6 d0             	movzbl %al,%edx
 13d:	8b 45 0c             	mov    0xc(%ebp),%eax
 140:	0f b6 00             	movzbl (%eax),%eax
 143:	0f b6 c0             	movzbl %al,%eax
 146:	29 c2                	sub    %eax,%edx
 148:	89 d0                	mov    %edx,%eax
}
 14a:	5d                   	pop    %ebp
 14b:	c3                   	ret    

0000014c <strlen>:

uint
strlen(char *s)
{
 14c:	55                   	push   %ebp
 14d:	89 e5                	mov    %esp,%ebp
 14f:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 152:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 159:	eb 04                	jmp    15f <strlen+0x13>
 15b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 15f:	8b 55 fc             	mov    -0x4(%ebp),%edx
 162:	8b 45 08             	mov    0x8(%ebp),%eax
 165:	01 d0                	add    %edx,%eax
 167:	0f b6 00             	movzbl (%eax),%eax
 16a:	84 c0                	test   %al,%al
 16c:	75 ed                	jne    15b <strlen+0xf>
    ;
  return n;
 16e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 171:	c9                   	leave  
 172:	c3                   	ret    

00000173 <memset>:

void*
memset(void *dst, int c, uint n)
{
 173:	55                   	push   %ebp
 174:	89 e5                	mov    %esp,%ebp
 176:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 179:	8b 45 10             	mov    0x10(%ebp),%eax
 17c:	89 44 24 08          	mov    %eax,0x8(%esp)
 180:	8b 45 0c             	mov    0xc(%ebp),%eax
 183:	89 44 24 04          	mov    %eax,0x4(%esp)
 187:	8b 45 08             	mov    0x8(%ebp),%eax
 18a:	89 04 24             	mov    %eax,(%esp)
 18d:	e8 26 ff ff ff       	call   b8 <stosb>
  return dst;
 192:	8b 45 08             	mov    0x8(%ebp),%eax
}
 195:	c9                   	leave  
 196:	c3                   	ret    

00000197 <strchr>:

char*
strchr(const char *s, char c)
{
 197:	55                   	push   %ebp
 198:	89 e5                	mov    %esp,%ebp
 19a:	83 ec 04             	sub    $0x4,%esp
 19d:	8b 45 0c             	mov    0xc(%ebp),%eax
 1a0:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 1a3:	eb 14                	jmp    1b9 <strchr+0x22>
    if(*s == c)
 1a5:	8b 45 08             	mov    0x8(%ebp),%eax
 1a8:	0f b6 00             	movzbl (%eax),%eax
 1ab:	3a 45 fc             	cmp    -0x4(%ebp),%al
 1ae:	75 05                	jne    1b5 <strchr+0x1e>
      return (char*)s;
 1b0:	8b 45 08             	mov    0x8(%ebp),%eax
 1b3:	eb 13                	jmp    1c8 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 1b5:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 1b9:	8b 45 08             	mov    0x8(%ebp),%eax
 1bc:	0f b6 00             	movzbl (%eax),%eax
 1bf:	84 c0                	test   %al,%al
 1c1:	75 e2                	jne    1a5 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 1c3:	b8 00 00 00 00       	mov    $0x0,%eax
}
 1c8:	c9                   	leave  
 1c9:	c3                   	ret    

000001ca <gets>:

char*
gets(char *buf, int max)
{
 1ca:	55                   	push   %ebp
 1cb:	89 e5                	mov    %esp,%ebp
 1cd:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1d0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 1d7:	eb 4c                	jmp    225 <gets+0x5b>
    cc = read(0, &c, 1);
 1d9:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 1e0:	00 
 1e1:	8d 45 ef             	lea    -0x11(%ebp),%eax
 1e4:	89 44 24 04          	mov    %eax,0x4(%esp)
 1e8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1ef:	e8 44 01 00 00       	call   338 <read>
 1f4:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1f7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1fb:	7f 02                	jg     1ff <gets+0x35>
      break;
 1fd:	eb 31                	jmp    230 <gets+0x66>
    buf[i++] = c;
 1ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
 202:	8d 50 01             	lea    0x1(%eax),%edx
 205:	89 55 f4             	mov    %edx,-0xc(%ebp)
 208:	89 c2                	mov    %eax,%edx
 20a:	8b 45 08             	mov    0x8(%ebp),%eax
 20d:	01 c2                	add    %eax,%edx
 20f:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 213:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 215:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 219:	3c 0a                	cmp    $0xa,%al
 21b:	74 13                	je     230 <gets+0x66>
 21d:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 221:	3c 0d                	cmp    $0xd,%al
 223:	74 0b                	je     230 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 225:	8b 45 f4             	mov    -0xc(%ebp),%eax
 228:	83 c0 01             	add    $0x1,%eax
 22b:	3b 45 0c             	cmp    0xc(%ebp),%eax
 22e:	7c a9                	jl     1d9 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 230:	8b 55 f4             	mov    -0xc(%ebp),%edx
 233:	8b 45 08             	mov    0x8(%ebp),%eax
 236:	01 d0                	add    %edx,%eax
 238:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 23b:	8b 45 08             	mov    0x8(%ebp),%eax
}
 23e:	c9                   	leave  
 23f:	c3                   	ret    

00000240 <stat>:

int
stat(char *n, struct stat *st)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 246:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 24d:	00 
 24e:	8b 45 08             	mov    0x8(%ebp),%eax
 251:	89 04 24             	mov    %eax,(%esp)
 254:	e8 07 01 00 00       	call   360 <open>
 259:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 25c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 260:	79 07                	jns    269 <stat+0x29>
    return -1;
 262:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 267:	eb 23                	jmp    28c <stat+0x4c>
  r = fstat(fd, st);
 269:	8b 45 0c             	mov    0xc(%ebp),%eax
 26c:	89 44 24 04          	mov    %eax,0x4(%esp)
 270:	8b 45 f4             	mov    -0xc(%ebp),%eax
 273:	89 04 24             	mov    %eax,(%esp)
 276:	e8 fd 00 00 00       	call   378 <fstat>
 27b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 27e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 281:	89 04 24             	mov    %eax,(%esp)
 284:	e8 bf 00 00 00       	call   348 <close>
  return r;
 289:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 28c:	c9                   	leave  
 28d:	c3                   	ret    

0000028e <atoi>:

int
atoi(const char *s)
{
 28e:	55                   	push   %ebp
 28f:	89 e5                	mov    %esp,%ebp
 291:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 294:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 29b:	eb 25                	jmp    2c2 <atoi+0x34>
    n = n*10 + *s++ - '0';
 29d:	8b 55 fc             	mov    -0x4(%ebp),%edx
 2a0:	89 d0                	mov    %edx,%eax
 2a2:	c1 e0 02             	shl    $0x2,%eax
 2a5:	01 d0                	add    %edx,%eax
 2a7:	01 c0                	add    %eax,%eax
 2a9:	89 c1                	mov    %eax,%ecx
 2ab:	8b 45 08             	mov    0x8(%ebp),%eax
 2ae:	8d 50 01             	lea    0x1(%eax),%edx
 2b1:	89 55 08             	mov    %edx,0x8(%ebp)
 2b4:	0f b6 00             	movzbl (%eax),%eax
 2b7:	0f be c0             	movsbl %al,%eax
 2ba:	01 c8                	add    %ecx,%eax
 2bc:	83 e8 30             	sub    $0x30,%eax
 2bf:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2c2:	8b 45 08             	mov    0x8(%ebp),%eax
 2c5:	0f b6 00             	movzbl (%eax),%eax
 2c8:	3c 2f                	cmp    $0x2f,%al
 2ca:	7e 0a                	jle    2d6 <atoi+0x48>
 2cc:	8b 45 08             	mov    0x8(%ebp),%eax
 2cf:	0f b6 00             	movzbl (%eax),%eax
 2d2:	3c 39                	cmp    $0x39,%al
 2d4:	7e c7                	jle    29d <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 2d6:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 2d9:	c9                   	leave  
 2da:	c3                   	ret    

000002db <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 2db:	55                   	push   %ebp
 2dc:	89 e5                	mov    %esp,%ebp
 2de:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 2e1:	8b 45 08             	mov    0x8(%ebp),%eax
 2e4:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 2e7:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ea:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 2ed:	eb 17                	jmp    306 <memmove+0x2b>
    *dst++ = *src++;
 2ef:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2f2:	8d 50 01             	lea    0x1(%eax),%edx
 2f5:	89 55 fc             	mov    %edx,-0x4(%ebp)
 2f8:	8b 55 f8             	mov    -0x8(%ebp),%edx
 2fb:	8d 4a 01             	lea    0x1(%edx),%ecx
 2fe:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 301:	0f b6 12             	movzbl (%edx),%edx
 304:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 306:	8b 45 10             	mov    0x10(%ebp),%eax
 309:	8d 50 ff             	lea    -0x1(%eax),%edx
 30c:	89 55 10             	mov    %edx,0x10(%ebp)
 30f:	85 c0                	test   %eax,%eax
 311:	7f dc                	jg     2ef <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 313:	8b 45 08             	mov    0x8(%ebp),%eax
}
 316:	c9                   	leave  
 317:	c3                   	ret    

00000318 <fork>:
 318:	b8 01 00 00 00       	mov    $0x1,%eax
 31d:	cd 40                	int    $0x40
 31f:	c3                   	ret    

00000320 <exit>:
 320:	b8 02 00 00 00       	mov    $0x2,%eax
 325:	cd 40                	int    $0x40
 327:	c3                   	ret    

00000328 <wait>:
 328:	b8 03 00 00 00       	mov    $0x3,%eax
 32d:	cd 40                	int    $0x40
 32f:	c3                   	ret    

00000330 <pipe>:
 330:	b8 04 00 00 00       	mov    $0x4,%eax
 335:	cd 40                	int    $0x40
 337:	c3                   	ret    

00000338 <read>:
 338:	b8 05 00 00 00       	mov    $0x5,%eax
 33d:	cd 40                	int    $0x40
 33f:	c3                   	ret    

00000340 <write>:
 340:	b8 10 00 00 00       	mov    $0x10,%eax
 345:	cd 40                	int    $0x40
 347:	c3                   	ret    

00000348 <close>:
 348:	b8 15 00 00 00       	mov    $0x15,%eax
 34d:	cd 40                	int    $0x40
 34f:	c3                   	ret    

00000350 <kill>:
 350:	b8 06 00 00 00       	mov    $0x6,%eax
 355:	cd 40                	int    $0x40
 357:	c3                   	ret    

00000358 <exec>:
 358:	b8 07 00 00 00       	mov    $0x7,%eax
 35d:	cd 40                	int    $0x40
 35f:	c3                   	ret    

00000360 <open>:
 360:	b8 0f 00 00 00       	mov    $0xf,%eax
 365:	cd 40                	int    $0x40
 367:	c3                   	ret    

00000368 <mknod>:
 368:	b8 11 00 00 00       	mov    $0x11,%eax
 36d:	cd 40                	int    $0x40
 36f:	c3                   	ret    

00000370 <unlink>:
 370:	b8 12 00 00 00       	mov    $0x12,%eax
 375:	cd 40                	int    $0x40
 377:	c3                   	ret    

00000378 <fstat>:
 378:	b8 08 00 00 00       	mov    $0x8,%eax
 37d:	cd 40                	int    $0x40
 37f:	c3                   	ret    

00000380 <link>:
 380:	b8 13 00 00 00       	mov    $0x13,%eax
 385:	cd 40                	int    $0x40
 387:	c3                   	ret    

00000388 <mkdir>:
 388:	b8 14 00 00 00       	mov    $0x14,%eax
 38d:	cd 40                	int    $0x40
 38f:	c3                   	ret    

00000390 <chdir>:
 390:	b8 09 00 00 00       	mov    $0x9,%eax
 395:	cd 40                	int    $0x40
 397:	c3                   	ret    

00000398 <dup>:
 398:	b8 0a 00 00 00       	mov    $0xa,%eax
 39d:	cd 40                	int    $0x40
 39f:	c3                   	ret    

000003a0 <getpid>:
 3a0:	b8 0b 00 00 00       	mov    $0xb,%eax
 3a5:	cd 40                	int    $0x40
 3a7:	c3                   	ret    

000003a8 <sbrk>:
 3a8:	b8 0c 00 00 00       	mov    $0xc,%eax
 3ad:	cd 40                	int    $0x40
 3af:	c3                   	ret    

000003b0 <sleep>:
 3b0:	b8 0d 00 00 00       	mov    $0xd,%eax
 3b5:	cd 40                	int    $0x40
 3b7:	c3                   	ret    

000003b8 <uptime>:
 3b8:	b8 0e 00 00 00       	mov    $0xe,%eax
 3bd:	cd 40                	int    $0x40
 3bf:	c3                   	ret    

000003c0 <exit_status>:
 3c0:	b8 16 00 00 00       	mov    $0x16,%eax
 3c5:	cd 40                	int    $0x40
 3c7:	c3                   	ret    

000003c8 <wait_status>:
 3c8:	b8 17 00 00 00       	mov    $0x17,%eax
 3cd:	cd 40                	int    $0x40
 3cf:	c3                   	ret    

000003d0 <waitpid>:
 3d0:	b8 18 00 00 00       	mov    $0x18,%eax
 3d5:	cd 40                	int    $0x40
 3d7:	c3                   	ret    

000003d8 <change_priority>:
 3d8:	b8 19 00 00 00       	mov    $0x19,%eax
 3dd:	cd 40                	int    $0x40
 3df:	c3                   	ret    

000003e0 <set_priority>:
 3e0:	b8 1a 00 00 00       	mov    $0x1a,%eax
 3e5:	cd 40                	int    $0x40
 3e7:	c3                   	ret    

000003e8 <putc>:
 3e8:	55                   	push   %ebp
 3e9:	89 e5                	mov    %esp,%ebp
 3eb:	83 ec 28             	sub    $0x28,%esp
 3ee:	8b 45 0c             	mov    0xc(%ebp),%eax
 3f1:	88 45 f4             	mov    %al,-0xc(%ebp)
 3f4:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 3fb:	00 
 3fc:	8d 45 f4             	lea    -0xc(%ebp),%eax
 3ff:	89 44 24 04          	mov    %eax,0x4(%esp)
 403:	8b 45 08             	mov    0x8(%ebp),%eax
 406:	89 04 24             	mov    %eax,(%esp)
 409:	e8 32 ff ff ff       	call   340 <write>
 40e:	c9                   	leave  
 40f:	c3                   	ret    

00000410 <printint>:
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	53                   	push   %ebx
 414:	83 ec 44             	sub    $0x44,%esp
 417:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 41e:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 422:	74 17                	je     43b <printint+0x2b>
 424:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 428:	79 11                	jns    43b <printint+0x2b>
 42a:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
 431:	8b 45 0c             	mov    0xc(%ebp),%eax
 434:	f7 d8                	neg    %eax
 436:	89 45 f4             	mov    %eax,-0xc(%ebp)
 439:	eb 06                	jmp    441 <printint+0x31>
 43b:	8b 45 0c             	mov    0xc(%ebp),%eax
 43e:	89 45 f4             	mov    %eax,-0xc(%ebp)
 441:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 448:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 44b:	8b 5d 10             	mov    0x10(%ebp),%ebx
 44e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 451:	ba 00 00 00 00       	mov    $0x0,%edx
 456:	f7 f3                	div    %ebx
 458:	89 d0                	mov    %edx,%eax
 45a:	0f b6 80 b8 0a 00 00 	movzbl 0xab8(%eax),%eax
 461:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 465:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 469:	8b 45 10             	mov    0x10(%ebp),%eax
 46c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 46f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 472:	ba 00 00 00 00       	mov    $0x0,%edx
 477:	f7 75 d4             	divl   -0x2c(%ebp)
 47a:	89 45 f4             	mov    %eax,-0xc(%ebp)
 47d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 481:	75 c5                	jne    448 <printint+0x38>
 483:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 487:	74 28                	je     4b1 <printint+0xa1>
 489:	8b 45 ec             	mov    -0x14(%ebp),%eax
 48c:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 491:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 495:	eb 1a                	jmp    4b1 <printint+0xa1>
 497:	8b 45 ec             	mov    -0x14(%ebp),%eax
 49a:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
 49f:	0f be c0             	movsbl %al,%eax
 4a2:	89 44 24 04          	mov    %eax,0x4(%esp)
 4a6:	8b 45 08             	mov    0x8(%ebp),%eax
 4a9:	89 04 24             	mov    %eax,(%esp)
 4ac:	e8 37 ff ff ff       	call   3e8 <putc>
 4b1:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
 4b5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4b9:	79 dc                	jns    497 <printint+0x87>
 4bb:	83 c4 44             	add    $0x44,%esp
 4be:	5b                   	pop    %ebx
 4bf:	5d                   	pop    %ebp
 4c0:	c3                   	ret    

000004c1 <printf>:
 4c1:	55                   	push   %ebp
 4c2:	89 e5                	mov    %esp,%ebp
 4c4:	83 ec 38             	sub    $0x38,%esp
 4c7:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 4ce:	8d 45 0c             	lea    0xc(%ebp),%eax
 4d1:	83 c0 04             	add    $0x4,%eax
 4d4:	89 45 f4             	mov    %eax,-0xc(%ebp)
 4d7:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 4de:	e9 7e 01 00 00       	jmp    661 <printf+0x1a0>
 4e3:	8b 55 0c             	mov    0xc(%ebp),%edx
 4e6:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4e9:	8d 04 02             	lea    (%edx,%eax,1),%eax
 4ec:	0f b6 00             	movzbl (%eax),%eax
 4ef:	0f be c0             	movsbl %al,%eax
 4f2:	25 ff 00 00 00       	and    $0xff,%eax
 4f7:	89 45 e8             	mov    %eax,-0x18(%ebp)
 4fa:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4fe:	75 2c                	jne    52c <printf+0x6b>
 500:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 504:	75 0c                	jne    512 <printf+0x51>
 506:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
 50d:	e9 4b 01 00 00       	jmp    65d <printf+0x19c>
 512:	8b 45 e8             	mov    -0x18(%ebp),%eax
 515:	0f be c0             	movsbl %al,%eax
 518:	89 44 24 04          	mov    %eax,0x4(%esp)
 51c:	8b 45 08             	mov    0x8(%ebp),%eax
 51f:	89 04 24             	mov    %eax,(%esp)
 522:	e8 c1 fe ff ff       	call   3e8 <putc>
 527:	e9 31 01 00 00       	jmp    65d <printf+0x19c>
 52c:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
 530:	0f 85 27 01 00 00    	jne    65d <printf+0x19c>
 536:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
 53a:	75 2d                	jne    569 <printf+0xa8>
 53c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 53f:	8b 00                	mov    (%eax),%eax
 541:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 548:	00 
 549:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 550:	00 
 551:	89 44 24 04          	mov    %eax,0x4(%esp)
 555:	8b 45 08             	mov    0x8(%ebp),%eax
 558:	89 04 24             	mov    %eax,(%esp)
 55b:	e8 b0 fe ff ff       	call   410 <printint>
 560:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 564:	e9 ed 00 00 00       	jmp    656 <printf+0x195>
 569:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
 56d:	74 06                	je     575 <printf+0xb4>
 56f:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
 573:	75 2d                	jne    5a2 <printf+0xe1>
 575:	8b 45 f4             	mov    -0xc(%ebp),%eax
 578:	8b 00                	mov    (%eax),%eax
 57a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 581:	00 
 582:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 589:	00 
 58a:	89 44 24 04          	mov    %eax,0x4(%esp)
 58e:	8b 45 08             	mov    0x8(%ebp),%eax
 591:	89 04 24             	mov    %eax,(%esp)
 594:	e8 77 fe ff ff       	call   410 <printint>
 599:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 59d:	e9 b4 00 00 00       	jmp    656 <printf+0x195>
 5a2:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
 5a6:	75 46                	jne    5ee <printf+0x12d>
 5a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5ab:	8b 00                	mov    (%eax),%eax
 5ad:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 5b0:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 5b4:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 5b8:	75 27                	jne    5e1 <printf+0x120>
 5ba:	c7 45 e4 d5 08 00 00 	movl   $0x8d5,-0x1c(%ebp)
 5c1:	eb 1f                	jmp    5e2 <printf+0x121>
 5c3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5c6:	0f b6 00             	movzbl (%eax),%eax
 5c9:	0f be c0             	movsbl %al,%eax
 5cc:	89 44 24 04          	mov    %eax,0x4(%esp)
 5d0:	8b 45 08             	mov    0x8(%ebp),%eax
 5d3:	89 04 24             	mov    %eax,(%esp)
 5d6:	e8 0d fe ff ff       	call   3e8 <putc>
 5db:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 5df:	eb 01                	jmp    5e2 <printf+0x121>
 5e1:	90                   	nop
 5e2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5e5:	0f b6 00             	movzbl (%eax),%eax
 5e8:	84 c0                	test   %al,%al
 5ea:	75 d7                	jne    5c3 <printf+0x102>
 5ec:	eb 68                	jmp    656 <printf+0x195>
 5ee:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
 5f2:	75 1d                	jne    611 <printf+0x150>
 5f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5f7:	8b 00                	mov    (%eax),%eax
 5f9:	0f be c0             	movsbl %al,%eax
 5fc:	89 44 24 04          	mov    %eax,0x4(%esp)
 600:	8b 45 08             	mov    0x8(%ebp),%eax
 603:	89 04 24             	mov    %eax,(%esp)
 606:	e8 dd fd ff ff       	call   3e8 <putc>
 60b:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 60f:	eb 45                	jmp    656 <printf+0x195>
 611:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 615:	75 17                	jne    62e <printf+0x16d>
 617:	8b 45 e8             	mov    -0x18(%ebp),%eax
 61a:	0f be c0             	movsbl %al,%eax
 61d:	89 44 24 04          	mov    %eax,0x4(%esp)
 621:	8b 45 08             	mov    0x8(%ebp),%eax
 624:	89 04 24             	mov    %eax,(%esp)
 627:	e8 bc fd ff ff       	call   3e8 <putc>
 62c:	eb 28                	jmp    656 <printf+0x195>
 62e:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 635:	00 
 636:	8b 45 08             	mov    0x8(%ebp),%eax
 639:	89 04 24             	mov    %eax,(%esp)
 63c:	e8 a7 fd ff ff       	call   3e8 <putc>
 641:	8b 45 e8             	mov    -0x18(%ebp),%eax
 644:	0f be c0             	movsbl %al,%eax
 647:	89 44 24 04          	mov    %eax,0x4(%esp)
 64b:	8b 45 08             	mov    0x8(%ebp),%eax
 64e:	89 04 24             	mov    %eax,(%esp)
 651:	e8 92 fd ff ff       	call   3e8 <putc>
 656:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 65d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 661:	8b 55 0c             	mov    0xc(%ebp),%edx
 664:	8b 45 ec             	mov    -0x14(%ebp),%eax
 667:	8d 04 02             	lea    (%edx,%eax,1),%eax
 66a:	0f b6 00             	movzbl (%eax),%eax
 66d:	84 c0                	test   %al,%al
 66f:	0f 85 6e fe ff ff    	jne    4e3 <printf+0x22>
 675:	c9                   	leave  
 676:	c3                   	ret    
 677:	90                   	nop

00000678 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 678:	55                   	push   %ebp
 679:	89 e5                	mov    %esp,%ebp
 67b:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 67e:	8b 45 08             	mov    0x8(%ebp),%eax
 681:	83 e8 08             	sub    $0x8,%eax
 684:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 687:	a1 d4 0a 00 00       	mov    0xad4,%eax
 68c:	89 45 fc             	mov    %eax,-0x4(%ebp)
 68f:	eb 24                	jmp    6b5 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 691:	8b 45 fc             	mov    -0x4(%ebp),%eax
 694:	8b 00                	mov    (%eax),%eax
 696:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 699:	77 12                	ja     6ad <free+0x35>
 69b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 69e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6a1:	77 24                	ja     6c7 <free+0x4f>
 6a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a6:	8b 00                	mov    (%eax),%eax
 6a8:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6ab:	77 1a                	ja     6c7 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6ad:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b0:	8b 00                	mov    (%eax),%eax
 6b2:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6b5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6b8:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6bb:	76 d4                	jbe    691 <free+0x19>
 6bd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6c0:	8b 00                	mov    (%eax),%eax
 6c2:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6c5:	76 ca                	jbe    691 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 6c7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6ca:	8b 40 04             	mov    0x4(%eax),%eax
 6cd:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 6d4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6d7:	01 c2                	add    %eax,%edx
 6d9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6dc:	8b 00                	mov    (%eax),%eax
 6de:	39 c2                	cmp    %eax,%edx
 6e0:	75 24                	jne    706 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 6e2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6e5:	8b 50 04             	mov    0x4(%eax),%edx
 6e8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6eb:	8b 00                	mov    (%eax),%eax
 6ed:	8b 40 04             	mov    0x4(%eax),%eax
 6f0:	01 c2                	add    %eax,%edx
 6f2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6f5:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 6f8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6fb:	8b 00                	mov    (%eax),%eax
 6fd:	8b 10                	mov    (%eax),%edx
 6ff:	8b 45 f8             	mov    -0x8(%ebp),%eax
 702:	89 10                	mov    %edx,(%eax)
 704:	eb 0a                	jmp    710 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 706:	8b 45 fc             	mov    -0x4(%ebp),%eax
 709:	8b 10                	mov    (%eax),%edx
 70b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 70e:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 710:	8b 45 fc             	mov    -0x4(%ebp),%eax
 713:	8b 40 04             	mov    0x4(%eax),%eax
 716:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 71d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 720:	01 d0                	add    %edx,%eax
 722:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 725:	75 20                	jne    747 <free+0xcf>
    p->s.size += bp->s.size;
 727:	8b 45 fc             	mov    -0x4(%ebp),%eax
 72a:	8b 50 04             	mov    0x4(%eax),%edx
 72d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 730:	8b 40 04             	mov    0x4(%eax),%eax
 733:	01 c2                	add    %eax,%edx
 735:	8b 45 fc             	mov    -0x4(%ebp),%eax
 738:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 73b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 73e:	8b 10                	mov    (%eax),%edx
 740:	8b 45 fc             	mov    -0x4(%ebp),%eax
 743:	89 10                	mov    %edx,(%eax)
 745:	eb 08                	jmp    74f <free+0xd7>
  } else
    p->s.ptr = bp;
 747:	8b 45 fc             	mov    -0x4(%ebp),%eax
 74a:	8b 55 f8             	mov    -0x8(%ebp),%edx
 74d:	89 10                	mov    %edx,(%eax)
  freep = p;
 74f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 752:	a3 d4 0a 00 00       	mov    %eax,0xad4
}
 757:	c9                   	leave  
 758:	c3                   	ret    

00000759 <morecore>:

static Header*
morecore(uint nu)
{
 759:	55                   	push   %ebp
 75a:	89 e5                	mov    %esp,%ebp
 75c:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 75f:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 766:	77 07                	ja     76f <morecore+0x16>
    nu = 4096;
 768:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 76f:	8b 45 08             	mov    0x8(%ebp),%eax
 772:	c1 e0 03             	shl    $0x3,%eax
 775:	89 04 24             	mov    %eax,(%esp)
 778:	e8 2b fc ff ff       	call   3a8 <sbrk>
 77d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 780:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 784:	75 07                	jne    78d <morecore+0x34>
    return 0;
 786:	b8 00 00 00 00       	mov    $0x0,%eax
 78b:	eb 22                	jmp    7af <morecore+0x56>
  hp = (Header*)p;
 78d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 790:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 793:	8b 45 f0             	mov    -0x10(%ebp),%eax
 796:	8b 55 08             	mov    0x8(%ebp),%edx
 799:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 79c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 79f:	83 c0 08             	add    $0x8,%eax
 7a2:	89 04 24             	mov    %eax,(%esp)
 7a5:	e8 ce fe ff ff       	call   678 <free>
  return freep;
 7aa:	a1 d4 0a 00 00       	mov    0xad4,%eax
}
 7af:	c9                   	leave  
 7b0:	c3                   	ret    

000007b1 <malloc>:

void*
malloc(uint nbytes)
{
 7b1:	55                   	push   %ebp
 7b2:	89 e5                	mov    %esp,%ebp
 7b4:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7b7:	8b 45 08             	mov    0x8(%ebp),%eax
 7ba:	83 c0 07             	add    $0x7,%eax
 7bd:	c1 e8 03             	shr    $0x3,%eax
 7c0:	83 c0 01             	add    $0x1,%eax
 7c3:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 7c6:	a1 d4 0a 00 00       	mov    0xad4,%eax
 7cb:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7ce:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 7d2:	75 23                	jne    7f7 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 7d4:	c7 45 f0 cc 0a 00 00 	movl   $0xacc,-0x10(%ebp)
 7db:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7de:	a3 d4 0a 00 00       	mov    %eax,0xad4
 7e3:	a1 d4 0a 00 00       	mov    0xad4,%eax
 7e8:	a3 cc 0a 00 00       	mov    %eax,0xacc
    base.s.size = 0;
 7ed:	c7 05 d0 0a 00 00 00 	movl   $0x0,0xad0
 7f4:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7f7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7fa:	8b 00                	mov    (%eax),%eax
 7fc:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 7ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
 802:	8b 40 04             	mov    0x4(%eax),%eax
 805:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 808:	72 4d                	jb     857 <malloc+0xa6>
      if(p->s.size == nunits)
 80a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80d:	8b 40 04             	mov    0x4(%eax),%eax
 810:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 813:	75 0c                	jne    821 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 815:	8b 45 f4             	mov    -0xc(%ebp),%eax
 818:	8b 10                	mov    (%eax),%edx
 81a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 81d:	89 10                	mov    %edx,(%eax)
 81f:	eb 26                	jmp    847 <malloc+0x96>
      else {
        p->s.size -= nunits;
 821:	8b 45 f4             	mov    -0xc(%ebp),%eax
 824:	8b 40 04             	mov    0x4(%eax),%eax
 827:	2b 45 ec             	sub    -0x14(%ebp),%eax
 82a:	89 c2                	mov    %eax,%edx
 82c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 82f:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 832:	8b 45 f4             	mov    -0xc(%ebp),%eax
 835:	8b 40 04             	mov    0x4(%eax),%eax
 838:	c1 e0 03             	shl    $0x3,%eax
 83b:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 83e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 841:	8b 55 ec             	mov    -0x14(%ebp),%edx
 844:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 847:	8b 45 f0             	mov    -0x10(%ebp),%eax
 84a:	a3 d4 0a 00 00       	mov    %eax,0xad4
      return (void*)(p + 1);
 84f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 852:	83 c0 08             	add    $0x8,%eax
 855:	eb 38                	jmp    88f <malloc+0xde>
    }
    if(p == freep)
 857:	a1 d4 0a 00 00       	mov    0xad4,%eax
 85c:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 85f:	75 1b                	jne    87c <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 861:	8b 45 ec             	mov    -0x14(%ebp),%eax
 864:	89 04 24             	mov    %eax,(%esp)
 867:	e8 ed fe ff ff       	call   759 <morecore>
 86c:	89 45 f4             	mov    %eax,-0xc(%ebp)
 86f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 873:	75 07                	jne    87c <malloc+0xcb>
        return 0;
 875:	b8 00 00 00 00       	mov    $0x0,%eax
 87a:	eb 13                	jmp    88f <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 87c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 87f:	89 45 f0             	mov    %eax,-0x10(%ebp)
 882:	8b 45 f4             	mov    -0xc(%ebp),%eax
 885:	8b 00                	mov    (%eax),%eax
 887:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 88a:	e9 70 ff ff ff       	jmp    7ff <malloc+0x4e>
}
 88f:	c9                   	leave  
 890:	c3                   	ret    
