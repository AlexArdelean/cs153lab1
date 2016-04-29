
_zombie:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 10             	sub    $0x10,%esp
  if(fork() > 0)
   9:	e8 76 02 00 00       	call   284 <fork>
   e:	85 c0                	test   %eax,%eax
  10:	7e 0c                	jle    1e <main+0x1e>
    sleep(5);  // Let child exit before parent.
  12:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
  19:	e8 fe 02 00 00       	call   31c <sleep>
  exit();
  1e:	e8 69 02 00 00       	call   28c <exit>
  23:	90                   	nop

00000024 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  24:	55                   	push   %ebp
  25:	89 e5                	mov    %esp,%ebp
  27:	57                   	push   %edi
  28:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  29:	8b 4d 08             	mov    0x8(%ebp),%ecx
  2c:	8b 55 10             	mov    0x10(%ebp),%edx
  2f:	8b 45 0c             	mov    0xc(%ebp),%eax
  32:	89 cb                	mov    %ecx,%ebx
  34:	89 df                	mov    %ebx,%edi
  36:	89 d1                	mov    %edx,%ecx
  38:	fc                   	cld    
  39:	f3 aa                	rep stos %al,%es:(%edi)
  3b:	89 ca                	mov    %ecx,%edx
  3d:	89 fb                	mov    %edi,%ebx
  3f:	89 5d 08             	mov    %ebx,0x8(%ebp)
  42:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  45:	5b                   	pop    %ebx
  46:	5f                   	pop    %edi
  47:	5d                   	pop    %ebp
  48:	c3                   	ret    

00000049 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  49:	55                   	push   %ebp
  4a:	89 e5                	mov    %esp,%ebp
  4c:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  4f:	8b 45 08             	mov    0x8(%ebp),%eax
  52:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  55:	90                   	nop
  56:	8b 45 08             	mov    0x8(%ebp),%eax
  59:	8d 50 01             	lea    0x1(%eax),%edx
  5c:	89 55 08             	mov    %edx,0x8(%ebp)
  5f:	8b 55 0c             	mov    0xc(%ebp),%edx
  62:	8d 4a 01             	lea    0x1(%edx),%ecx
  65:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  68:	0f b6 12             	movzbl (%edx),%edx
  6b:	88 10                	mov    %dl,(%eax)
  6d:	0f b6 00             	movzbl (%eax),%eax
  70:	84 c0                	test   %al,%al
  72:	75 e2                	jne    56 <strcpy+0xd>
    ;
  return os;
  74:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  77:	c9                   	leave  
  78:	c3                   	ret    

00000079 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  79:	55                   	push   %ebp
  7a:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  7c:	eb 08                	jmp    86 <strcmp+0xd>
    p++, q++;
  7e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  82:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  86:	8b 45 08             	mov    0x8(%ebp),%eax
  89:	0f b6 00             	movzbl (%eax),%eax
  8c:	84 c0                	test   %al,%al
  8e:	74 10                	je     a0 <strcmp+0x27>
  90:	8b 45 08             	mov    0x8(%ebp),%eax
  93:	0f b6 10             	movzbl (%eax),%edx
  96:	8b 45 0c             	mov    0xc(%ebp),%eax
  99:	0f b6 00             	movzbl (%eax),%eax
  9c:	38 c2                	cmp    %al,%dl
  9e:	74 de                	je     7e <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  a0:	8b 45 08             	mov    0x8(%ebp),%eax
  a3:	0f b6 00             	movzbl (%eax),%eax
  a6:	0f b6 d0             	movzbl %al,%edx
  a9:	8b 45 0c             	mov    0xc(%ebp),%eax
  ac:	0f b6 00             	movzbl (%eax),%eax
  af:	0f b6 c0             	movzbl %al,%eax
  b2:	29 c2                	sub    %eax,%edx
  b4:	89 d0                	mov    %edx,%eax
}
  b6:	5d                   	pop    %ebp
  b7:	c3                   	ret    

000000b8 <strlen>:

uint
strlen(char *s)
{
  b8:	55                   	push   %ebp
  b9:	89 e5                	mov    %esp,%ebp
  bb:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
  be:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  c5:	eb 04                	jmp    cb <strlen+0x13>
  c7:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  cb:	8b 55 fc             	mov    -0x4(%ebp),%edx
  ce:	8b 45 08             	mov    0x8(%ebp),%eax
  d1:	01 d0                	add    %edx,%eax
  d3:	0f b6 00             	movzbl (%eax),%eax
  d6:	84 c0                	test   %al,%al
  d8:	75 ed                	jne    c7 <strlen+0xf>
    ;
  return n;
  da:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  dd:	c9                   	leave  
  de:	c3                   	ret    

000000df <memset>:

void*
memset(void *dst, int c, uint n)
{
  df:	55                   	push   %ebp
  e0:	89 e5                	mov    %esp,%ebp
  e2:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
  e5:	8b 45 10             	mov    0x10(%ebp),%eax
  e8:	89 44 24 08          	mov    %eax,0x8(%esp)
  ec:	8b 45 0c             	mov    0xc(%ebp),%eax
  ef:	89 44 24 04          	mov    %eax,0x4(%esp)
  f3:	8b 45 08             	mov    0x8(%ebp),%eax
  f6:	89 04 24             	mov    %eax,(%esp)
  f9:	e8 26 ff ff ff       	call   24 <stosb>
  return dst;
  fe:	8b 45 08             	mov    0x8(%ebp),%eax
}
 101:	c9                   	leave  
 102:	c3                   	ret    

00000103 <strchr>:

char*
strchr(const char *s, char c)
{
 103:	55                   	push   %ebp
 104:	89 e5                	mov    %esp,%ebp
 106:	83 ec 04             	sub    $0x4,%esp
 109:	8b 45 0c             	mov    0xc(%ebp),%eax
 10c:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 10f:	eb 14                	jmp    125 <strchr+0x22>
    if(*s == c)
 111:	8b 45 08             	mov    0x8(%ebp),%eax
 114:	0f b6 00             	movzbl (%eax),%eax
 117:	3a 45 fc             	cmp    -0x4(%ebp),%al
 11a:	75 05                	jne    121 <strchr+0x1e>
      return (char*)s;
 11c:	8b 45 08             	mov    0x8(%ebp),%eax
 11f:	eb 13                	jmp    134 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 121:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 125:	8b 45 08             	mov    0x8(%ebp),%eax
 128:	0f b6 00             	movzbl (%eax),%eax
 12b:	84 c0                	test   %al,%al
 12d:	75 e2                	jne    111 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 12f:	b8 00 00 00 00       	mov    $0x0,%eax
}
 134:	c9                   	leave  
 135:	c3                   	ret    

00000136 <gets>:

char*
gets(char *buf, int max)
{
 136:	55                   	push   %ebp
 137:	89 e5                	mov    %esp,%ebp
 139:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 13c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 143:	eb 4c                	jmp    191 <gets+0x5b>
    cc = read(0, &c, 1);
 145:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 14c:	00 
 14d:	8d 45 ef             	lea    -0x11(%ebp),%eax
 150:	89 44 24 04          	mov    %eax,0x4(%esp)
 154:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 15b:	e8 44 01 00 00       	call   2a4 <read>
 160:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 163:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 167:	7f 02                	jg     16b <gets+0x35>
      break;
 169:	eb 31                	jmp    19c <gets+0x66>
    buf[i++] = c;
 16b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 16e:	8d 50 01             	lea    0x1(%eax),%edx
 171:	89 55 f4             	mov    %edx,-0xc(%ebp)
 174:	89 c2                	mov    %eax,%edx
 176:	8b 45 08             	mov    0x8(%ebp),%eax
 179:	01 c2                	add    %eax,%edx
 17b:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 17f:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 181:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 185:	3c 0a                	cmp    $0xa,%al
 187:	74 13                	je     19c <gets+0x66>
 189:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 18d:	3c 0d                	cmp    $0xd,%al
 18f:	74 0b                	je     19c <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 191:	8b 45 f4             	mov    -0xc(%ebp),%eax
 194:	83 c0 01             	add    $0x1,%eax
 197:	3b 45 0c             	cmp    0xc(%ebp),%eax
 19a:	7c a9                	jl     145 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 19c:	8b 55 f4             	mov    -0xc(%ebp),%edx
 19f:	8b 45 08             	mov    0x8(%ebp),%eax
 1a2:	01 d0                	add    %edx,%eax
 1a4:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1a7:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1aa:	c9                   	leave  
 1ab:	c3                   	ret    

000001ac <stat>:

int
stat(char *n, struct stat *st)
{
 1ac:	55                   	push   %ebp
 1ad:	89 e5                	mov    %esp,%ebp
 1af:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1b2:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1b9:	00 
 1ba:	8b 45 08             	mov    0x8(%ebp),%eax
 1bd:	89 04 24             	mov    %eax,(%esp)
 1c0:	e8 07 01 00 00       	call   2cc <open>
 1c5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 1c8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1cc:	79 07                	jns    1d5 <stat+0x29>
    return -1;
 1ce:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1d3:	eb 23                	jmp    1f8 <stat+0x4c>
  r = fstat(fd, st);
 1d5:	8b 45 0c             	mov    0xc(%ebp),%eax
 1d8:	89 44 24 04          	mov    %eax,0x4(%esp)
 1dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1df:	89 04 24             	mov    %eax,(%esp)
 1e2:	e8 fd 00 00 00       	call   2e4 <fstat>
 1e7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 1ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1ed:	89 04 24             	mov    %eax,(%esp)
 1f0:	e8 bf 00 00 00       	call   2b4 <close>
  return r;
 1f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 1f8:	c9                   	leave  
 1f9:	c3                   	ret    

000001fa <atoi>:

int
atoi(const char *s)
{
 1fa:	55                   	push   %ebp
 1fb:	89 e5                	mov    %esp,%ebp
 1fd:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 200:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 207:	eb 25                	jmp    22e <atoi+0x34>
    n = n*10 + *s++ - '0';
 209:	8b 55 fc             	mov    -0x4(%ebp),%edx
 20c:	89 d0                	mov    %edx,%eax
 20e:	c1 e0 02             	shl    $0x2,%eax
 211:	01 d0                	add    %edx,%eax
 213:	01 c0                	add    %eax,%eax
 215:	89 c1                	mov    %eax,%ecx
 217:	8b 45 08             	mov    0x8(%ebp),%eax
 21a:	8d 50 01             	lea    0x1(%eax),%edx
 21d:	89 55 08             	mov    %edx,0x8(%ebp)
 220:	0f b6 00             	movzbl (%eax),%eax
 223:	0f be c0             	movsbl %al,%eax
 226:	01 c8                	add    %ecx,%eax
 228:	83 e8 30             	sub    $0x30,%eax
 22b:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 22e:	8b 45 08             	mov    0x8(%ebp),%eax
 231:	0f b6 00             	movzbl (%eax),%eax
 234:	3c 2f                	cmp    $0x2f,%al
 236:	7e 0a                	jle    242 <atoi+0x48>
 238:	8b 45 08             	mov    0x8(%ebp),%eax
 23b:	0f b6 00             	movzbl (%eax),%eax
 23e:	3c 39                	cmp    $0x39,%al
 240:	7e c7                	jle    209 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 242:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 245:	c9                   	leave  
 246:	c3                   	ret    

00000247 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 247:	55                   	push   %ebp
 248:	89 e5                	mov    %esp,%ebp
 24a:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 24d:	8b 45 08             	mov    0x8(%ebp),%eax
 250:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 253:	8b 45 0c             	mov    0xc(%ebp),%eax
 256:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 259:	eb 17                	jmp    272 <memmove+0x2b>
    *dst++ = *src++;
 25b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 25e:	8d 50 01             	lea    0x1(%eax),%edx
 261:	89 55 fc             	mov    %edx,-0x4(%ebp)
 264:	8b 55 f8             	mov    -0x8(%ebp),%edx
 267:	8d 4a 01             	lea    0x1(%edx),%ecx
 26a:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 26d:	0f b6 12             	movzbl (%edx),%edx
 270:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 272:	8b 45 10             	mov    0x10(%ebp),%eax
 275:	8d 50 ff             	lea    -0x1(%eax),%edx
 278:	89 55 10             	mov    %edx,0x10(%ebp)
 27b:	85 c0                	test   %eax,%eax
 27d:	7f dc                	jg     25b <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 27f:	8b 45 08             	mov    0x8(%ebp),%eax
}
 282:	c9                   	leave  
 283:	c3                   	ret    

00000284 <fork>:
 284:	b8 01 00 00 00       	mov    $0x1,%eax
 289:	cd 40                	int    $0x40
 28b:	c3                   	ret    

0000028c <exit>:
 28c:	b8 02 00 00 00       	mov    $0x2,%eax
 291:	cd 40                	int    $0x40
 293:	c3                   	ret    

00000294 <wait>:
 294:	b8 03 00 00 00       	mov    $0x3,%eax
 299:	cd 40                	int    $0x40
 29b:	c3                   	ret    

0000029c <pipe>:
 29c:	b8 04 00 00 00       	mov    $0x4,%eax
 2a1:	cd 40                	int    $0x40
 2a3:	c3                   	ret    

000002a4 <read>:
 2a4:	b8 05 00 00 00       	mov    $0x5,%eax
 2a9:	cd 40                	int    $0x40
 2ab:	c3                   	ret    

000002ac <write>:
 2ac:	b8 10 00 00 00       	mov    $0x10,%eax
 2b1:	cd 40                	int    $0x40
 2b3:	c3                   	ret    

000002b4 <close>:
 2b4:	b8 15 00 00 00       	mov    $0x15,%eax
 2b9:	cd 40                	int    $0x40
 2bb:	c3                   	ret    

000002bc <kill>:
 2bc:	b8 06 00 00 00       	mov    $0x6,%eax
 2c1:	cd 40                	int    $0x40
 2c3:	c3                   	ret    

000002c4 <exec>:
 2c4:	b8 07 00 00 00       	mov    $0x7,%eax
 2c9:	cd 40                	int    $0x40
 2cb:	c3                   	ret    

000002cc <open>:
 2cc:	b8 0f 00 00 00       	mov    $0xf,%eax
 2d1:	cd 40                	int    $0x40
 2d3:	c3                   	ret    

000002d4 <mknod>:
 2d4:	b8 11 00 00 00       	mov    $0x11,%eax
 2d9:	cd 40                	int    $0x40
 2db:	c3                   	ret    

000002dc <unlink>:
 2dc:	b8 12 00 00 00       	mov    $0x12,%eax
 2e1:	cd 40                	int    $0x40
 2e3:	c3                   	ret    

000002e4 <fstat>:
 2e4:	b8 08 00 00 00       	mov    $0x8,%eax
 2e9:	cd 40                	int    $0x40
 2eb:	c3                   	ret    

000002ec <link>:
 2ec:	b8 13 00 00 00       	mov    $0x13,%eax
 2f1:	cd 40                	int    $0x40
 2f3:	c3                   	ret    

000002f4 <mkdir>:
 2f4:	b8 14 00 00 00       	mov    $0x14,%eax
 2f9:	cd 40                	int    $0x40
 2fb:	c3                   	ret    

000002fc <chdir>:
 2fc:	b8 09 00 00 00       	mov    $0x9,%eax
 301:	cd 40                	int    $0x40
 303:	c3                   	ret    

00000304 <dup>:
 304:	b8 0a 00 00 00       	mov    $0xa,%eax
 309:	cd 40                	int    $0x40
 30b:	c3                   	ret    

0000030c <getpid>:
 30c:	b8 0b 00 00 00       	mov    $0xb,%eax
 311:	cd 40                	int    $0x40
 313:	c3                   	ret    

00000314 <sbrk>:
 314:	b8 0c 00 00 00       	mov    $0xc,%eax
 319:	cd 40                	int    $0x40
 31b:	c3                   	ret    

0000031c <sleep>:
 31c:	b8 0d 00 00 00       	mov    $0xd,%eax
 321:	cd 40                	int    $0x40
 323:	c3                   	ret    

00000324 <uptime>:
 324:	b8 0e 00 00 00       	mov    $0xe,%eax
 329:	cd 40                	int    $0x40
 32b:	c3                   	ret    

0000032c <exit_status>:
 32c:	b8 16 00 00 00       	mov    $0x16,%eax
 331:	cd 40                	int    $0x40
 333:	c3                   	ret    

00000334 <wait_status>:
 334:	b8 17 00 00 00       	mov    $0x17,%eax
 339:	cd 40                	int    $0x40
 33b:	c3                   	ret    

0000033c <waitpid>:
 33c:	b8 18 00 00 00       	mov    $0x18,%eax
 341:	cd 40                	int    $0x40
 343:	c3                   	ret    

00000344 <change_priority>:
 344:	b8 19 00 00 00       	mov    $0x19,%eax
 349:	cd 40                	int    $0x40
 34b:	c3                   	ret    

0000034c <set_priority>:
 34c:	b8 1a 00 00 00       	mov    $0x1a,%eax
 351:	cd 40                	int    $0x40
 353:	c3                   	ret    

00000354 <putc>:
 354:	55                   	push   %ebp
 355:	89 e5                	mov    %esp,%ebp
 357:	83 ec 28             	sub    $0x28,%esp
 35a:	8b 45 0c             	mov    0xc(%ebp),%eax
 35d:	88 45 f4             	mov    %al,-0xc(%ebp)
 360:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 367:	00 
 368:	8d 45 f4             	lea    -0xc(%ebp),%eax
 36b:	89 44 24 04          	mov    %eax,0x4(%esp)
 36f:	8b 45 08             	mov    0x8(%ebp),%eax
 372:	89 04 24             	mov    %eax,(%esp)
 375:	e8 32 ff ff ff       	call   2ac <write>
 37a:	c9                   	leave  
 37b:	c3                   	ret    

0000037c <printint>:
 37c:	55                   	push   %ebp
 37d:	89 e5                	mov    %esp,%ebp
 37f:	53                   	push   %ebx
 380:	83 ec 44             	sub    $0x44,%esp
 383:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 38a:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 38e:	74 17                	je     3a7 <printint+0x2b>
 390:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 394:	79 11                	jns    3a7 <printint+0x2b>
 396:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
 39d:	8b 45 0c             	mov    0xc(%ebp),%eax
 3a0:	f7 d8                	neg    %eax
 3a2:	89 45 f4             	mov    %eax,-0xc(%ebp)
 3a5:	eb 06                	jmp    3ad <printint+0x31>
 3a7:	8b 45 0c             	mov    0xc(%ebp),%eax
 3aa:	89 45 f4             	mov    %eax,-0xc(%ebp)
 3ad:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 3b4:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 3b7:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3bd:	ba 00 00 00 00       	mov    $0x0,%edx
 3c2:	f7 f3                	div    %ebx
 3c4:	89 d0                	mov    %edx,%eax
 3c6:	0f b6 80 e0 09 00 00 	movzbl 0x9e0(%eax),%eax
 3cd:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 3d1:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 3d5:	8b 45 10             	mov    0x10(%ebp),%eax
 3d8:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 3db:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3de:	ba 00 00 00 00       	mov    $0x0,%edx
 3e3:	f7 75 d4             	divl   -0x2c(%ebp)
 3e6:	89 45 f4             	mov    %eax,-0xc(%ebp)
 3e9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 3ed:	75 c5                	jne    3b4 <printint+0x38>
 3ef:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 3f3:	74 28                	je     41d <printint+0xa1>
 3f5:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3f8:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 3fd:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 401:	eb 1a                	jmp    41d <printint+0xa1>
 403:	8b 45 ec             	mov    -0x14(%ebp),%eax
 406:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
 40b:	0f be c0             	movsbl %al,%eax
 40e:	89 44 24 04          	mov    %eax,0x4(%esp)
 412:	8b 45 08             	mov    0x8(%ebp),%eax
 415:	89 04 24             	mov    %eax,(%esp)
 418:	e8 37 ff ff ff       	call   354 <putc>
 41d:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
 421:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 425:	79 dc                	jns    403 <printint+0x87>
 427:	83 c4 44             	add    $0x44,%esp
 42a:	5b                   	pop    %ebx
 42b:	5d                   	pop    %ebp
 42c:	c3                   	ret    

0000042d <printf>:
 42d:	55                   	push   %ebp
 42e:	89 e5                	mov    %esp,%ebp
 430:	83 ec 38             	sub    $0x38,%esp
 433:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 43a:	8d 45 0c             	lea    0xc(%ebp),%eax
 43d:	83 c0 04             	add    $0x4,%eax
 440:	89 45 f4             	mov    %eax,-0xc(%ebp)
 443:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 44a:	e9 7e 01 00 00       	jmp    5cd <printf+0x1a0>
 44f:	8b 55 0c             	mov    0xc(%ebp),%edx
 452:	8b 45 ec             	mov    -0x14(%ebp),%eax
 455:	8d 04 02             	lea    (%edx,%eax,1),%eax
 458:	0f b6 00             	movzbl (%eax),%eax
 45b:	0f be c0             	movsbl %al,%eax
 45e:	25 ff 00 00 00       	and    $0xff,%eax
 463:	89 45 e8             	mov    %eax,-0x18(%ebp)
 466:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 46a:	75 2c                	jne    498 <printf+0x6b>
 46c:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 470:	75 0c                	jne    47e <printf+0x51>
 472:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
 479:	e9 4b 01 00 00       	jmp    5c9 <printf+0x19c>
 47e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 481:	0f be c0             	movsbl %al,%eax
 484:	89 44 24 04          	mov    %eax,0x4(%esp)
 488:	8b 45 08             	mov    0x8(%ebp),%eax
 48b:	89 04 24             	mov    %eax,(%esp)
 48e:	e8 c1 fe ff ff       	call   354 <putc>
 493:	e9 31 01 00 00       	jmp    5c9 <printf+0x19c>
 498:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
 49c:	0f 85 27 01 00 00    	jne    5c9 <printf+0x19c>
 4a2:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
 4a6:	75 2d                	jne    4d5 <printf+0xa8>
 4a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4ab:	8b 00                	mov    (%eax),%eax
 4ad:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 4b4:	00 
 4b5:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 4bc:	00 
 4bd:	89 44 24 04          	mov    %eax,0x4(%esp)
 4c1:	8b 45 08             	mov    0x8(%ebp),%eax
 4c4:	89 04 24             	mov    %eax,(%esp)
 4c7:	e8 b0 fe ff ff       	call   37c <printint>
 4cc:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 4d0:	e9 ed 00 00 00       	jmp    5c2 <printf+0x195>
 4d5:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
 4d9:	74 06                	je     4e1 <printf+0xb4>
 4db:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
 4df:	75 2d                	jne    50e <printf+0xe1>
 4e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4e4:	8b 00                	mov    (%eax),%eax
 4e6:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 4ed:	00 
 4ee:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 4f5:	00 
 4f6:	89 44 24 04          	mov    %eax,0x4(%esp)
 4fa:	8b 45 08             	mov    0x8(%ebp),%eax
 4fd:	89 04 24             	mov    %eax,(%esp)
 500:	e8 77 fe ff ff       	call   37c <printint>
 505:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 509:	e9 b4 00 00 00       	jmp    5c2 <printf+0x195>
 50e:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
 512:	75 46                	jne    55a <printf+0x12d>
 514:	8b 45 f4             	mov    -0xc(%ebp),%eax
 517:	8b 00                	mov    (%eax),%eax
 519:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 51c:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 520:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 524:	75 27                	jne    54d <printf+0x120>
 526:	c7 45 e4 fd 07 00 00 	movl   $0x7fd,-0x1c(%ebp)
 52d:	eb 1f                	jmp    54e <printf+0x121>
 52f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 532:	0f b6 00             	movzbl (%eax),%eax
 535:	0f be c0             	movsbl %al,%eax
 538:	89 44 24 04          	mov    %eax,0x4(%esp)
 53c:	8b 45 08             	mov    0x8(%ebp),%eax
 53f:	89 04 24             	mov    %eax,(%esp)
 542:	e8 0d fe ff ff       	call   354 <putc>
 547:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 54b:	eb 01                	jmp    54e <printf+0x121>
 54d:	90                   	nop
 54e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 551:	0f b6 00             	movzbl (%eax),%eax
 554:	84 c0                	test   %al,%al
 556:	75 d7                	jne    52f <printf+0x102>
 558:	eb 68                	jmp    5c2 <printf+0x195>
 55a:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
 55e:	75 1d                	jne    57d <printf+0x150>
 560:	8b 45 f4             	mov    -0xc(%ebp),%eax
 563:	8b 00                	mov    (%eax),%eax
 565:	0f be c0             	movsbl %al,%eax
 568:	89 44 24 04          	mov    %eax,0x4(%esp)
 56c:	8b 45 08             	mov    0x8(%ebp),%eax
 56f:	89 04 24             	mov    %eax,(%esp)
 572:	e8 dd fd ff ff       	call   354 <putc>
 577:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 57b:	eb 45                	jmp    5c2 <printf+0x195>
 57d:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 581:	75 17                	jne    59a <printf+0x16d>
 583:	8b 45 e8             	mov    -0x18(%ebp),%eax
 586:	0f be c0             	movsbl %al,%eax
 589:	89 44 24 04          	mov    %eax,0x4(%esp)
 58d:	8b 45 08             	mov    0x8(%ebp),%eax
 590:	89 04 24             	mov    %eax,(%esp)
 593:	e8 bc fd ff ff       	call   354 <putc>
 598:	eb 28                	jmp    5c2 <printf+0x195>
 59a:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 5a1:	00 
 5a2:	8b 45 08             	mov    0x8(%ebp),%eax
 5a5:	89 04 24             	mov    %eax,(%esp)
 5a8:	e8 a7 fd ff ff       	call   354 <putc>
 5ad:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5b0:	0f be c0             	movsbl %al,%eax
 5b3:	89 44 24 04          	mov    %eax,0x4(%esp)
 5b7:	8b 45 08             	mov    0x8(%ebp),%eax
 5ba:	89 04 24             	mov    %eax,(%esp)
 5bd:	e8 92 fd ff ff       	call   354 <putc>
 5c2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 5c9:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 5cd:	8b 55 0c             	mov    0xc(%ebp),%edx
 5d0:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5d3:	8d 04 02             	lea    (%edx,%eax,1),%eax
 5d6:	0f b6 00             	movzbl (%eax),%eax
 5d9:	84 c0                	test   %al,%al
 5db:	0f 85 6e fe ff ff    	jne    44f <printf+0x22>
 5e1:	c9                   	leave  
 5e2:	c3                   	ret    
 5e3:	90                   	nop

000005e4 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5e4:	55                   	push   %ebp
 5e5:	89 e5                	mov    %esp,%ebp
 5e7:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5ea:	8b 45 08             	mov    0x8(%ebp),%eax
 5ed:	83 e8 08             	sub    $0x8,%eax
 5f0:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5f3:	a1 fc 09 00 00       	mov    0x9fc,%eax
 5f8:	89 45 fc             	mov    %eax,-0x4(%ebp)
 5fb:	eb 24                	jmp    621 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5fd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 600:	8b 00                	mov    (%eax),%eax
 602:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 605:	77 12                	ja     619 <free+0x35>
 607:	8b 45 f8             	mov    -0x8(%ebp),%eax
 60a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 60d:	77 24                	ja     633 <free+0x4f>
 60f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 612:	8b 00                	mov    (%eax),%eax
 614:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 617:	77 1a                	ja     633 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 619:	8b 45 fc             	mov    -0x4(%ebp),%eax
 61c:	8b 00                	mov    (%eax),%eax
 61e:	89 45 fc             	mov    %eax,-0x4(%ebp)
 621:	8b 45 f8             	mov    -0x8(%ebp),%eax
 624:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 627:	76 d4                	jbe    5fd <free+0x19>
 629:	8b 45 fc             	mov    -0x4(%ebp),%eax
 62c:	8b 00                	mov    (%eax),%eax
 62e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 631:	76 ca                	jbe    5fd <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 633:	8b 45 f8             	mov    -0x8(%ebp),%eax
 636:	8b 40 04             	mov    0x4(%eax),%eax
 639:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 640:	8b 45 f8             	mov    -0x8(%ebp),%eax
 643:	01 c2                	add    %eax,%edx
 645:	8b 45 fc             	mov    -0x4(%ebp),%eax
 648:	8b 00                	mov    (%eax),%eax
 64a:	39 c2                	cmp    %eax,%edx
 64c:	75 24                	jne    672 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 64e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 651:	8b 50 04             	mov    0x4(%eax),%edx
 654:	8b 45 fc             	mov    -0x4(%ebp),%eax
 657:	8b 00                	mov    (%eax),%eax
 659:	8b 40 04             	mov    0x4(%eax),%eax
 65c:	01 c2                	add    %eax,%edx
 65e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 661:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 664:	8b 45 fc             	mov    -0x4(%ebp),%eax
 667:	8b 00                	mov    (%eax),%eax
 669:	8b 10                	mov    (%eax),%edx
 66b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 66e:	89 10                	mov    %edx,(%eax)
 670:	eb 0a                	jmp    67c <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 672:	8b 45 fc             	mov    -0x4(%ebp),%eax
 675:	8b 10                	mov    (%eax),%edx
 677:	8b 45 f8             	mov    -0x8(%ebp),%eax
 67a:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 67c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 67f:	8b 40 04             	mov    0x4(%eax),%eax
 682:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 689:	8b 45 fc             	mov    -0x4(%ebp),%eax
 68c:	01 d0                	add    %edx,%eax
 68e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 691:	75 20                	jne    6b3 <free+0xcf>
    p->s.size += bp->s.size;
 693:	8b 45 fc             	mov    -0x4(%ebp),%eax
 696:	8b 50 04             	mov    0x4(%eax),%edx
 699:	8b 45 f8             	mov    -0x8(%ebp),%eax
 69c:	8b 40 04             	mov    0x4(%eax),%eax
 69f:	01 c2                	add    %eax,%edx
 6a1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a4:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6a7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6aa:	8b 10                	mov    (%eax),%edx
 6ac:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6af:	89 10                	mov    %edx,(%eax)
 6b1:	eb 08                	jmp    6bb <free+0xd7>
  } else
    p->s.ptr = bp;
 6b3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b6:	8b 55 f8             	mov    -0x8(%ebp),%edx
 6b9:	89 10                	mov    %edx,(%eax)
  freep = p;
 6bb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6be:	a3 fc 09 00 00       	mov    %eax,0x9fc
}
 6c3:	c9                   	leave  
 6c4:	c3                   	ret    

000006c5 <morecore>:

static Header*
morecore(uint nu)
{
 6c5:	55                   	push   %ebp
 6c6:	89 e5                	mov    %esp,%ebp
 6c8:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 6cb:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 6d2:	77 07                	ja     6db <morecore+0x16>
    nu = 4096;
 6d4:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 6db:	8b 45 08             	mov    0x8(%ebp),%eax
 6de:	c1 e0 03             	shl    $0x3,%eax
 6e1:	89 04 24             	mov    %eax,(%esp)
 6e4:	e8 2b fc ff ff       	call   314 <sbrk>
 6e9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 6ec:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 6f0:	75 07                	jne    6f9 <morecore+0x34>
    return 0;
 6f2:	b8 00 00 00 00       	mov    $0x0,%eax
 6f7:	eb 22                	jmp    71b <morecore+0x56>
  hp = (Header*)p;
 6f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6fc:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 6ff:	8b 45 f0             	mov    -0x10(%ebp),%eax
 702:	8b 55 08             	mov    0x8(%ebp),%edx
 705:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 708:	8b 45 f0             	mov    -0x10(%ebp),%eax
 70b:	83 c0 08             	add    $0x8,%eax
 70e:	89 04 24             	mov    %eax,(%esp)
 711:	e8 ce fe ff ff       	call   5e4 <free>
  return freep;
 716:	a1 fc 09 00 00       	mov    0x9fc,%eax
}
 71b:	c9                   	leave  
 71c:	c3                   	ret    

0000071d <malloc>:

void*
malloc(uint nbytes)
{
 71d:	55                   	push   %ebp
 71e:	89 e5                	mov    %esp,%ebp
 720:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 723:	8b 45 08             	mov    0x8(%ebp),%eax
 726:	83 c0 07             	add    $0x7,%eax
 729:	c1 e8 03             	shr    $0x3,%eax
 72c:	83 c0 01             	add    $0x1,%eax
 72f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 732:	a1 fc 09 00 00       	mov    0x9fc,%eax
 737:	89 45 f0             	mov    %eax,-0x10(%ebp)
 73a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 73e:	75 23                	jne    763 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 740:	c7 45 f0 f4 09 00 00 	movl   $0x9f4,-0x10(%ebp)
 747:	8b 45 f0             	mov    -0x10(%ebp),%eax
 74a:	a3 fc 09 00 00       	mov    %eax,0x9fc
 74f:	a1 fc 09 00 00       	mov    0x9fc,%eax
 754:	a3 f4 09 00 00       	mov    %eax,0x9f4
    base.s.size = 0;
 759:	c7 05 f8 09 00 00 00 	movl   $0x0,0x9f8
 760:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 763:	8b 45 f0             	mov    -0x10(%ebp),%eax
 766:	8b 00                	mov    (%eax),%eax
 768:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 76b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 76e:	8b 40 04             	mov    0x4(%eax),%eax
 771:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 774:	72 4d                	jb     7c3 <malloc+0xa6>
      if(p->s.size == nunits)
 776:	8b 45 f4             	mov    -0xc(%ebp),%eax
 779:	8b 40 04             	mov    0x4(%eax),%eax
 77c:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 77f:	75 0c                	jne    78d <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 781:	8b 45 f4             	mov    -0xc(%ebp),%eax
 784:	8b 10                	mov    (%eax),%edx
 786:	8b 45 f0             	mov    -0x10(%ebp),%eax
 789:	89 10                	mov    %edx,(%eax)
 78b:	eb 26                	jmp    7b3 <malloc+0x96>
      else {
        p->s.size -= nunits;
 78d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 790:	8b 40 04             	mov    0x4(%eax),%eax
 793:	2b 45 ec             	sub    -0x14(%ebp),%eax
 796:	89 c2                	mov    %eax,%edx
 798:	8b 45 f4             	mov    -0xc(%ebp),%eax
 79b:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 79e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7a1:	8b 40 04             	mov    0x4(%eax),%eax
 7a4:	c1 e0 03             	shl    $0x3,%eax
 7a7:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 7aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ad:	8b 55 ec             	mov    -0x14(%ebp),%edx
 7b0:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 7b3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7b6:	a3 fc 09 00 00       	mov    %eax,0x9fc
      return (void*)(p + 1);
 7bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7be:	83 c0 08             	add    $0x8,%eax
 7c1:	eb 38                	jmp    7fb <malloc+0xde>
    }
    if(p == freep)
 7c3:	a1 fc 09 00 00       	mov    0x9fc,%eax
 7c8:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 7cb:	75 1b                	jne    7e8 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 7cd:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7d0:	89 04 24             	mov    %eax,(%esp)
 7d3:	e8 ed fe ff ff       	call   6c5 <morecore>
 7d8:	89 45 f4             	mov    %eax,-0xc(%ebp)
 7db:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7df:	75 07                	jne    7e8 <malloc+0xcb>
        return 0;
 7e1:	b8 00 00 00 00       	mov    $0x0,%eax
 7e6:	eb 13                	jmp    7fb <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7eb:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7f1:	8b 00                	mov    (%eax),%eax
 7f3:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 7f6:	e9 70 ff ff ff       	jmp    76b <malloc+0x4e>
}
 7fb:	c9                   	leave  
 7fc:	c3                   	ret    
