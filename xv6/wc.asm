
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <wc>:

char buf[512];

void
wc(int fd, char *name)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 48             	sub    $0x48,%esp
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
   6:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
   d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10:	89 45 ec             	mov    %eax,-0x14(%ebp)
  13:	8b 45 ec             	mov    -0x14(%ebp),%eax
  16:	89 45 f0             	mov    %eax,-0x10(%ebp)
  inword = 0;
  19:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  while((n = read(fd, buf, sizeof(buf))) > 0){
  20:	eb 68                	jmp    8a <wc+0x8a>
    for(i=0; i<n; i++){
  22:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  29:	eb 57                	jmp    82 <wc+0x82>
      c++;
  2b:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
      if(buf[i] == '\n')
  2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  32:	05 40 0c 00 00       	add    $0xc40,%eax
  37:	0f b6 00             	movzbl (%eax),%eax
  3a:	3c 0a                	cmp    $0xa,%al
  3c:	75 04                	jne    42 <wc+0x42>
        l++;
  3e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      if(strchr(" \r\t\n\v", buf[i]))
  42:	8b 45 f4             	mov    -0xc(%ebp),%eax
  45:	05 40 0c 00 00       	add    $0xc40,%eax
  4a:	0f b6 00             	movzbl (%eax),%eax
  4d:	0f be c0             	movsbl %al,%eax
  50:	89 44 24 04          	mov    %eax,0x4(%esp)
  54:	c7 04 24 b5 09 00 00 	movl   $0x9b5,(%esp)
  5b:	e8 5b 02 00 00       	call   2bb <strchr>
  60:	85 c0                	test   %eax,%eax
  62:	74 09                	je     6d <wc+0x6d>
        inword = 0;
  64:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  6b:	eb 11                	jmp    7e <wc+0x7e>
      else if(!inword){
  6d:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  71:	75 0b                	jne    7e <wc+0x7e>
        w++;
  73:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
        inword = 1;
  77:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
  7e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  82:	8b 45 f4             	mov    -0xc(%ebp),%eax
  85:	3b 45 e0             	cmp    -0x20(%ebp),%eax
  88:	7c a1                	jl     2b <wc+0x2b>
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
  8a:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  91:	00 
  92:	c7 44 24 04 40 0c 00 	movl   $0xc40,0x4(%esp)
  99:	00 
  9a:	8b 45 08             	mov    0x8(%ebp),%eax
  9d:	89 04 24             	mov    %eax,(%esp)
  a0:	e8 b7 03 00 00       	call   45c <read>
  a5:	89 45 e0             	mov    %eax,-0x20(%ebp)
  a8:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  ac:	0f 8f 70 ff ff ff    	jg     22 <wc+0x22>
        w++;
        inword = 1;
      }
    }
  }
  if(n < 0){
  b2:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  b6:	79 19                	jns    d1 <wc+0xd1>
    printf(1, "wc: read error\n");
  b8:	c7 44 24 04 bb 09 00 	movl   $0x9bb,0x4(%esp)
  bf:	00 
  c0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  c7:	e8 19 05 00 00       	call   5e5 <printf>
    exit();
  cc:	e8 73 03 00 00       	call   444 <exit>
  }
  printf(1, "%d %d %d %s\n", l, w, c, name);
  d1:	8b 45 0c             	mov    0xc(%ebp),%eax
  d4:	89 44 24 14          	mov    %eax,0x14(%esp)
  d8:	8b 45 e8             	mov    -0x18(%ebp),%eax
  db:	89 44 24 10          	mov    %eax,0x10(%esp)
  df:	8b 45 ec             	mov    -0x14(%ebp),%eax
  e2:	89 44 24 0c          	mov    %eax,0xc(%esp)
  e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  e9:	89 44 24 08          	mov    %eax,0x8(%esp)
  ed:	c7 44 24 04 cb 09 00 	movl   $0x9cb,0x4(%esp)
  f4:	00 
  f5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  fc:	e8 e4 04 00 00       	call   5e5 <printf>
}
 101:	c9                   	leave  
 102:	c3                   	ret    

00000103 <main>:

int
main(int argc, char *argv[])
{
 103:	55                   	push   %ebp
 104:	89 e5                	mov    %esp,%ebp
 106:	83 e4 f0             	and    $0xfffffff0,%esp
 109:	83 ec 20             	sub    $0x20,%esp
  int fd, i;

  if(argc <= 1){
 10c:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
 110:	7f 19                	jg     12b <main+0x28>
    wc(0, "");
 112:	c7 44 24 04 d8 09 00 	movl   $0x9d8,0x4(%esp)
 119:	00 
 11a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 121:	e8 da fe ff ff       	call   0 <wc>
    exit();
 126:	e8 19 03 00 00       	call   444 <exit>
  }

  for(i = 1; i < argc; i++){
 12b:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
 132:	00 
 133:	e9 8f 00 00 00       	jmp    1c7 <main+0xc4>
    if((fd = open(argv[i], 0)) < 0){
 138:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 13c:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 143:	8b 45 0c             	mov    0xc(%ebp),%eax
 146:	01 d0                	add    %edx,%eax
 148:	8b 00                	mov    (%eax),%eax
 14a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 151:	00 
 152:	89 04 24             	mov    %eax,(%esp)
 155:	e8 2a 03 00 00       	call   484 <open>
 15a:	89 44 24 18          	mov    %eax,0x18(%esp)
 15e:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
 163:	79 2f                	jns    194 <main+0x91>
      printf(1, "wc: cannot open %s\n", argv[i]);
 165:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 169:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 170:	8b 45 0c             	mov    0xc(%ebp),%eax
 173:	01 d0                	add    %edx,%eax
 175:	8b 00                	mov    (%eax),%eax
 177:	89 44 24 08          	mov    %eax,0x8(%esp)
 17b:	c7 44 24 04 d9 09 00 	movl   $0x9d9,0x4(%esp)
 182:	00 
 183:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 18a:	e8 56 04 00 00       	call   5e5 <printf>
      exit();
 18f:	e8 b0 02 00 00       	call   444 <exit>
    }
    wc(fd, argv[i]);
 194:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 198:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 19f:	8b 45 0c             	mov    0xc(%ebp),%eax
 1a2:	01 d0                	add    %edx,%eax
 1a4:	8b 00                	mov    (%eax),%eax
 1a6:	89 44 24 04          	mov    %eax,0x4(%esp)
 1aa:	8b 44 24 18          	mov    0x18(%esp),%eax
 1ae:	89 04 24             	mov    %eax,(%esp)
 1b1:	e8 4a fe ff ff       	call   0 <wc>
    close(fd);
 1b6:	8b 44 24 18          	mov    0x18(%esp),%eax
 1ba:	89 04 24             	mov    %eax,(%esp)
 1bd:	e8 aa 02 00 00       	call   46c <close>
  if(argc <= 1){
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
 1c2:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
 1c7:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 1cb:	3b 45 08             	cmp    0x8(%ebp),%eax
 1ce:	0f 8c 64 ff ff ff    	jl     138 <main+0x35>
      exit();
    }
    wc(fd, argv[i]);
    close(fd);
  }
  exit();
 1d4:	e8 6b 02 00 00       	call   444 <exit>
 1d9:	66 90                	xchg   %ax,%ax
 1db:	90                   	nop

000001dc <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 1dc:	55                   	push   %ebp
 1dd:	89 e5                	mov    %esp,%ebp
 1df:	57                   	push   %edi
 1e0:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 1e1:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1e4:	8b 55 10             	mov    0x10(%ebp),%edx
 1e7:	8b 45 0c             	mov    0xc(%ebp),%eax
 1ea:	89 cb                	mov    %ecx,%ebx
 1ec:	89 df                	mov    %ebx,%edi
 1ee:	89 d1                	mov    %edx,%ecx
 1f0:	fc                   	cld    
 1f1:	f3 aa                	rep stos %al,%es:(%edi)
 1f3:	89 ca                	mov    %ecx,%edx
 1f5:	89 fb                	mov    %edi,%ebx
 1f7:	89 5d 08             	mov    %ebx,0x8(%ebp)
 1fa:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 1fd:	5b                   	pop    %ebx
 1fe:	5f                   	pop    %edi
 1ff:	5d                   	pop    %ebp
 200:	c3                   	ret    

00000201 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 201:	55                   	push   %ebp
 202:	89 e5                	mov    %esp,%ebp
 204:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 207:	8b 45 08             	mov    0x8(%ebp),%eax
 20a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 20d:	90                   	nop
 20e:	8b 45 08             	mov    0x8(%ebp),%eax
 211:	8d 50 01             	lea    0x1(%eax),%edx
 214:	89 55 08             	mov    %edx,0x8(%ebp)
 217:	8b 55 0c             	mov    0xc(%ebp),%edx
 21a:	8d 4a 01             	lea    0x1(%edx),%ecx
 21d:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 220:	0f b6 12             	movzbl (%edx),%edx
 223:	88 10                	mov    %dl,(%eax)
 225:	0f b6 00             	movzbl (%eax),%eax
 228:	84 c0                	test   %al,%al
 22a:	75 e2                	jne    20e <strcpy+0xd>
    ;
  return os;
 22c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 22f:	c9                   	leave  
 230:	c3                   	ret    

00000231 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 231:	55                   	push   %ebp
 232:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 234:	eb 08                	jmp    23e <strcmp+0xd>
    p++, q++;
 236:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 23a:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 23e:	8b 45 08             	mov    0x8(%ebp),%eax
 241:	0f b6 00             	movzbl (%eax),%eax
 244:	84 c0                	test   %al,%al
 246:	74 10                	je     258 <strcmp+0x27>
 248:	8b 45 08             	mov    0x8(%ebp),%eax
 24b:	0f b6 10             	movzbl (%eax),%edx
 24e:	8b 45 0c             	mov    0xc(%ebp),%eax
 251:	0f b6 00             	movzbl (%eax),%eax
 254:	38 c2                	cmp    %al,%dl
 256:	74 de                	je     236 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 258:	8b 45 08             	mov    0x8(%ebp),%eax
 25b:	0f b6 00             	movzbl (%eax),%eax
 25e:	0f b6 d0             	movzbl %al,%edx
 261:	8b 45 0c             	mov    0xc(%ebp),%eax
 264:	0f b6 00             	movzbl (%eax),%eax
 267:	0f b6 c0             	movzbl %al,%eax
 26a:	29 c2                	sub    %eax,%edx
 26c:	89 d0                	mov    %edx,%eax
}
 26e:	5d                   	pop    %ebp
 26f:	c3                   	ret    

00000270 <strlen>:

uint
strlen(char *s)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 276:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 27d:	eb 04                	jmp    283 <strlen+0x13>
 27f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 283:	8b 55 fc             	mov    -0x4(%ebp),%edx
 286:	8b 45 08             	mov    0x8(%ebp),%eax
 289:	01 d0                	add    %edx,%eax
 28b:	0f b6 00             	movzbl (%eax),%eax
 28e:	84 c0                	test   %al,%al
 290:	75 ed                	jne    27f <strlen+0xf>
    ;
  return n;
 292:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 295:	c9                   	leave  
 296:	c3                   	ret    

00000297 <memset>:

void*
memset(void *dst, int c, uint n)
{
 297:	55                   	push   %ebp
 298:	89 e5                	mov    %esp,%ebp
 29a:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 29d:	8b 45 10             	mov    0x10(%ebp),%eax
 2a0:	89 44 24 08          	mov    %eax,0x8(%esp)
 2a4:	8b 45 0c             	mov    0xc(%ebp),%eax
 2a7:	89 44 24 04          	mov    %eax,0x4(%esp)
 2ab:	8b 45 08             	mov    0x8(%ebp),%eax
 2ae:	89 04 24             	mov    %eax,(%esp)
 2b1:	e8 26 ff ff ff       	call   1dc <stosb>
  return dst;
 2b6:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2b9:	c9                   	leave  
 2ba:	c3                   	ret    

000002bb <strchr>:

char*
strchr(const char *s, char c)
{
 2bb:	55                   	push   %ebp
 2bc:	89 e5                	mov    %esp,%ebp
 2be:	83 ec 04             	sub    $0x4,%esp
 2c1:	8b 45 0c             	mov    0xc(%ebp),%eax
 2c4:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 2c7:	eb 14                	jmp    2dd <strchr+0x22>
    if(*s == c)
 2c9:	8b 45 08             	mov    0x8(%ebp),%eax
 2cc:	0f b6 00             	movzbl (%eax),%eax
 2cf:	3a 45 fc             	cmp    -0x4(%ebp),%al
 2d2:	75 05                	jne    2d9 <strchr+0x1e>
      return (char*)s;
 2d4:	8b 45 08             	mov    0x8(%ebp),%eax
 2d7:	eb 13                	jmp    2ec <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 2d9:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2dd:	8b 45 08             	mov    0x8(%ebp),%eax
 2e0:	0f b6 00             	movzbl (%eax),%eax
 2e3:	84 c0                	test   %al,%al
 2e5:	75 e2                	jne    2c9 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 2e7:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2ec:	c9                   	leave  
 2ed:	c3                   	ret    

000002ee <gets>:

char*
gets(char *buf, int max)
{
 2ee:	55                   	push   %ebp
 2ef:	89 e5                	mov    %esp,%ebp
 2f1:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2f4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 2fb:	eb 4c                	jmp    349 <gets+0x5b>
    cc = read(0, &c, 1);
 2fd:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 304:	00 
 305:	8d 45 ef             	lea    -0x11(%ebp),%eax
 308:	89 44 24 04          	mov    %eax,0x4(%esp)
 30c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 313:	e8 44 01 00 00       	call   45c <read>
 318:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 31b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 31f:	7f 02                	jg     323 <gets+0x35>
      break;
 321:	eb 31                	jmp    354 <gets+0x66>
    buf[i++] = c;
 323:	8b 45 f4             	mov    -0xc(%ebp),%eax
 326:	8d 50 01             	lea    0x1(%eax),%edx
 329:	89 55 f4             	mov    %edx,-0xc(%ebp)
 32c:	89 c2                	mov    %eax,%edx
 32e:	8b 45 08             	mov    0x8(%ebp),%eax
 331:	01 c2                	add    %eax,%edx
 333:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 337:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 339:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 33d:	3c 0a                	cmp    $0xa,%al
 33f:	74 13                	je     354 <gets+0x66>
 341:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 345:	3c 0d                	cmp    $0xd,%al
 347:	74 0b                	je     354 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 349:	8b 45 f4             	mov    -0xc(%ebp),%eax
 34c:	83 c0 01             	add    $0x1,%eax
 34f:	3b 45 0c             	cmp    0xc(%ebp),%eax
 352:	7c a9                	jl     2fd <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 354:	8b 55 f4             	mov    -0xc(%ebp),%edx
 357:	8b 45 08             	mov    0x8(%ebp),%eax
 35a:	01 d0                	add    %edx,%eax
 35c:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 35f:	8b 45 08             	mov    0x8(%ebp),%eax
}
 362:	c9                   	leave  
 363:	c3                   	ret    

00000364 <stat>:

int
stat(char *n, struct stat *st)
{
 364:	55                   	push   %ebp
 365:	89 e5                	mov    %esp,%ebp
 367:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 36a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 371:	00 
 372:	8b 45 08             	mov    0x8(%ebp),%eax
 375:	89 04 24             	mov    %eax,(%esp)
 378:	e8 07 01 00 00       	call   484 <open>
 37d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 380:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 384:	79 07                	jns    38d <stat+0x29>
    return -1;
 386:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 38b:	eb 23                	jmp    3b0 <stat+0x4c>
  r = fstat(fd, st);
 38d:	8b 45 0c             	mov    0xc(%ebp),%eax
 390:	89 44 24 04          	mov    %eax,0x4(%esp)
 394:	8b 45 f4             	mov    -0xc(%ebp),%eax
 397:	89 04 24             	mov    %eax,(%esp)
 39a:	e8 fd 00 00 00       	call   49c <fstat>
 39f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 3a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3a5:	89 04 24             	mov    %eax,(%esp)
 3a8:	e8 bf 00 00 00       	call   46c <close>
  return r;
 3ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 3b0:	c9                   	leave  
 3b1:	c3                   	ret    

000003b2 <atoi>:

int
atoi(const char *s)
{
 3b2:	55                   	push   %ebp
 3b3:	89 e5                	mov    %esp,%ebp
 3b5:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 3b8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 3bf:	eb 25                	jmp    3e6 <atoi+0x34>
    n = n*10 + *s++ - '0';
 3c1:	8b 55 fc             	mov    -0x4(%ebp),%edx
 3c4:	89 d0                	mov    %edx,%eax
 3c6:	c1 e0 02             	shl    $0x2,%eax
 3c9:	01 d0                	add    %edx,%eax
 3cb:	01 c0                	add    %eax,%eax
 3cd:	89 c1                	mov    %eax,%ecx
 3cf:	8b 45 08             	mov    0x8(%ebp),%eax
 3d2:	8d 50 01             	lea    0x1(%eax),%edx
 3d5:	89 55 08             	mov    %edx,0x8(%ebp)
 3d8:	0f b6 00             	movzbl (%eax),%eax
 3db:	0f be c0             	movsbl %al,%eax
 3de:	01 c8                	add    %ecx,%eax
 3e0:	83 e8 30             	sub    $0x30,%eax
 3e3:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3e6:	8b 45 08             	mov    0x8(%ebp),%eax
 3e9:	0f b6 00             	movzbl (%eax),%eax
 3ec:	3c 2f                	cmp    $0x2f,%al
 3ee:	7e 0a                	jle    3fa <atoi+0x48>
 3f0:	8b 45 08             	mov    0x8(%ebp),%eax
 3f3:	0f b6 00             	movzbl (%eax),%eax
 3f6:	3c 39                	cmp    $0x39,%al
 3f8:	7e c7                	jle    3c1 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 3fa:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3fd:	c9                   	leave  
 3fe:	c3                   	ret    

000003ff <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 3ff:	55                   	push   %ebp
 400:	89 e5                	mov    %esp,%ebp
 402:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 405:	8b 45 08             	mov    0x8(%ebp),%eax
 408:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 40b:	8b 45 0c             	mov    0xc(%ebp),%eax
 40e:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 411:	eb 17                	jmp    42a <memmove+0x2b>
    *dst++ = *src++;
 413:	8b 45 fc             	mov    -0x4(%ebp),%eax
 416:	8d 50 01             	lea    0x1(%eax),%edx
 419:	89 55 fc             	mov    %edx,-0x4(%ebp)
 41c:	8b 55 f8             	mov    -0x8(%ebp),%edx
 41f:	8d 4a 01             	lea    0x1(%edx),%ecx
 422:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 425:	0f b6 12             	movzbl (%edx),%edx
 428:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 42a:	8b 45 10             	mov    0x10(%ebp),%eax
 42d:	8d 50 ff             	lea    -0x1(%eax),%edx
 430:	89 55 10             	mov    %edx,0x10(%ebp)
 433:	85 c0                	test   %eax,%eax
 435:	7f dc                	jg     413 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 437:	8b 45 08             	mov    0x8(%ebp),%eax
}
 43a:	c9                   	leave  
 43b:	c3                   	ret    

0000043c <fork>:
 43c:	b8 01 00 00 00       	mov    $0x1,%eax
 441:	cd 40                	int    $0x40
 443:	c3                   	ret    

00000444 <exit>:
 444:	b8 02 00 00 00       	mov    $0x2,%eax
 449:	cd 40                	int    $0x40
 44b:	c3                   	ret    

0000044c <wait>:
 44c:	b8 03 00 00 00       	mov    $0x3,%eax
 451:	cd 40                	int    $0x40
 453:	c3                   	ret    

00000454 <pipe>:
 454:	b8 04 00 00 00       	mov    $0x4,%eax
 459:	cd 40                	int    $0x40
 45b:	c3                   	ret    

0000045c <read>:
 45c:	b8 05 00 00 00       	mov    $0x5,%eax
 461:	cd 40                	int    $0x40
 463:	c3                   	ret    

00000464 <write>:
 464:	b8 10 00 00 00       	mov    $0x10,%eax
 469:	cd 40                	int    $0x40
 46b:	c3                   	ret    

0000046c <close>:
 46c:	b8 15 00 00 00       	mov    $0x15,%eax
 471:	cd 40                	int    $0x40
 473:	c3                   	ret    

00000474 <kill>:
 474:	b8 06 00 00 00       	mov    $0x6,%eax
 479:	cd 40                	int    $0x40
 47b:	c3                   	ret    

0000047c <exec>:
 47c:	b8 07 00 00 00       	mov    $0x7,%eax
 481:	cd 40                	int    $0x40
 483:	c3                   	ret    

00000484 <open>:
 484:	b8 0f 00 00 00       	mov    $0xf,%eax
 489:	cd 40                	int    $0x40
 48b:	c3                   	ret    

0000048c <mknod>:
 48c:	b8 11 00 00 00       	mov    $0x11,%eax
 491:	cd 40                	int    $0x40
 493:	c3                   	ret    

00000494 <unlink>:
 494:	b8 12 00 00 00       	mov    $0x12,%eax
 499:	cd 40                	int    $0x40
 49b:	c3                   	ret    

0000049c <fstat>:
 49c:	b8 08 00 00 00       	mov    $0x8,%eax
 4a1:	cd 40                	int    $0x40
 4a3:	c3                   	ret    

000004a4 <link>:
 4a4:	b8 13 00 00 00       	mov    $0x13,%eax
 4a9:	cd 40                	int    $0x40
 4ab:	c3                   	ret    

000004ac <mkdir>:
 4ac:	b8 14 00 00 00       	mov    $0x14,%eax
 4b1:	cd 40                	int    $0x40
 4b3:	c3                   	ret    

000004b4 <chdir>:
 4b4:	b8 09 00 00 00       	mov    $0x9,%eax
 4b9:	cd 40                	int    $0x40
 4bb:	c3                   	ret    

000004bc <dup>:
 4bc:	b8 0a 00 00 00       	mov    $0xa,%eax
 4c1:	cd 40                	int    $0x40
 4c3:	c3                   	ret    

000004c4 <getpid>:
 4c4:	b8 0b 00 00 00       	mov    $0xb,%eax
 4c9:	cd 40                	int    $0x40
 4cb:	c3                   	ret    

000004cc <sbrk>:
 4cc:	b8 0c 00 00 00       	mov    $0xc,%eax
 4d1:	cd 40                	int    $0x40
 4d3:	c3                   	ret    

000004d4 <sleep>:
 4d4:	b8 0d 00 00 00       	mov    $0xd,%eax
 4d9:	cd 40                	int    $0x40
 4db:	c3                   	ret    

000004dc <uptime>:
 4dc:	b8 0e 00 00 00       	mov    $0xe,%eax
 4e1:	cd 40                	int    $0x40
 4e3:	c3                   	ret    

000004e4 <exit_status>:
 4e4:	b8 16 00 00 00       	mov    $0x16,%eax
 4e9:	cd 40                	int    $0x40
 4eb:	c3                   	ret    

000004ec <wait_status>:
 4ec:	b8 17 00 00 00       	mov    $0x17,%eax
 4f1:	cd 40                	int    $0x40
 4f3:	c3                   	ret    

000004f4 <waitpid>:
 4f4:	b8 18 00 00 00       	mov    $0x18,%eax
 4f9:	cd 40                	int    $0x40
 4fb:	c3                   	ret    

000004fc <change_priority>:
 4fc:	b8 19 00 00 00       	mov    $0x19,%eax
 501:	cd 40                	int    $0x40
 503:	c3                   	ret    

00000504 <set_priority>:
 504:	b8 1a 00 00 00       	mov    $0x1a,%eax
 509:	cd 40                	int    $0x40
 50b:	c3                   	ret    

0000050c <putc>:
 50c:	55                   	push   %ebp
 50d:	89 e5                	mov    %esp,%ebp
 50f:	83 ec 28             	sub    $0x28,%esp
 512:	8b 45 0c             	mov    0xc(%ebp),%eax
 515:	88 45 f4             	mov    %al,-0xc(%ebp)
 518:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 51f:	00 
 520:	8d 45 f4             	lea    -0xc(%ebp),%eax
 523:	89 44 24 04          	mov    %eax,0x4(%esp)
 527:	8b 45 08             	mov    0x8(%ebp),%eax
 52a:	89 04 24             	mov    %eax,(%esp)
 52d:	e8 32 ff ff ff       	call   464 <write>
 532:	c9                   	leave  
 533:	c3                   	ret    

00000534 <printint>:
 534:	55                   	push   %ebp
 535:	89 e5                	mov    %esp,%ebp
 537:	53                   	push   %ebx
 538:	83 ec 44             	sub    $0x44,%esp
 53b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 542:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 546:	74 17                	je     55f <printint+0x2b>
 548:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 54c:	79 11                	jns    55f <printint+0x2b>
 54e:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
 555:	8b 45 0c             	mov    0xc(%ebp),%eax
 558:	f7 d8                	neg    %eax
 55a:	89 45 f4             	mov    %eax,-0xc(%ebp)
 55d:	eb 06                	jmp    565 <printint+0x31>
 55f:	8b 45 0c             	mov    0xc(%ebp),%eax
 562:	89 45 f4             	mov    %eax,-0xc(%ebp)
 565:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 56c:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 56f:	8b 5d 10             	mov    0x10(%ebp),%ebx
 572:	8b 45 f4             	mov    -0xc(%ebp),%eax
 575:	ba 00 00 00 00       	mov    $0x0,%edx
 57a:	f7 f3                	div    %ebx
 57c:	89 d0                	mov    %edx,%eax
 57e:	0f b6 80 f0 0b 00 00 	movzbl 0xbf0(%eax),%eax
 585:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 589:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 58d:	8b 45 10             	mov    0x10(%ebp),%eax
 590:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 593:	8b 45 f4             	mov    -0xc(%ebp),%eax
 596:	ba 00 00 00 00       	mov    $0x0,%edx
 59b:	f7 75 d4             	divl   -0x2c(%ebp)
 59e:	89 45 f4             	mov    %eax,-0xc(%ebp)
 5a1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5a5:	75 c5                	jne    56c <printint+0x38>
 5a7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 5ab:	74 28                	je     5d5 <printint+0xa1>
 5ad:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5b0:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 5b5:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 5b9:	eb 1a                	jmp    5d5 <printint+0xa1>
 5bb:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5be:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
 5c3:	0f be c0             	movsbl %al,%eax
 5c6:	89 44 24 04          	mov    %eax,0x4(%esp)
 5ca:	8b 45 08             	mov    0x8(%ebp),%eax
 5cd:	89 04 24             	mov    %eax,(%esp)
 5d0:	e8 37 ff ff ff       	call   50c <putc>
 5d5:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
 5d9:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5dd:	79 dc                	jns    5bb <printint+0x87>
 5df:	83 c4 44             	add    $0x44,%esp
 5e2:	5b                   	pop    %ebx
 5e3:	5d                   	pop    %ebp
 5e4:	c3                   	ret    

000005e5 <printf>:
 5e5:	55                   	push   %ebp
 5e6:	89 e5                	mov    %esp,%ebp
 5e8:	83 ec 38             	sub    $0x38,%esp
 5eb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 5f2:	8d 45 0c             	lea    0xc(%ebp),%eax
 5f5:	83 c0 04             	add    $0x4,%eax
 5f8:	89 45 f4             	mov    %eax,-0xc(%ebp)
 5fb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 602:	e9 7e 01 00 00       	jmp    785 <printf+0x1a0>
 607:	8b 55 0c             	mov    0xc(%ebp),%edx
 60a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 60d:	8d 04 02             	lea    (%edx,%eax,1),%eax
 610:	0f b6 00             	movzbl (%eax),%eax
 613:	0f be c0             	movsbl %al,%eax
 616:	25 ff 00 00 00       	and    $0xff,%eax
 61b:	89 45 e8             	mov    %eax,-0x18(%ebp)
 61e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 622:	75 2c                	jne    650 <printf+0x6b>
 624:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 628:	75 0c                	jne    636 <printf+0x51>
 62a:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
 631:	e9 4b 01 00 00       	jmp    781 <printf+0x19c>
 636:	8b 45 e8             	mov    -0x18(%ebp),%eax
 639:	0f be c0             	movsbl %al,%eax
 63c:	89 44 24 04          	mov    %eax,0x4(%esp)
 640:	8b 45 08             	mov    0x8(%ebp),%eax
 643:	89 04 24             	mov    %eax,(%esp)
 646:	e8 c1 fe ff ff       	call   50c <putc>
 64b:	e9 31 01 00 00       	jmp    781 <printf+0x19c>
 650:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
 654:	0f 85 27 01 00 00    	jne    781 <printf+0x19c>
 65a:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
 65e:	75 2d                	jne    68d <printf+0xa8>
 660:	8b 45 f4             	mov    -0xc(%ebp),%eax
 663:	8b 00                	mov    (%eax),%eax
 665:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 66c:	00 
 66d:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 674:	00 
 675:	89 44 24 04          	mov    %eax,0x4(%esp)
 679:	8b 45 08             	mov    0x8(%ebp),%eax
 67c:	89 04 24             	mov    %eax,(%esp)
 67f:	e8 b0 fe ff ff       	call   534 <printint>
 684:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 688:	e9 ed 00 00 00       	jmp    77a <printf+0x195>
 68d:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
 691:	74 06                	je     699 <printf+0xb4>
 693:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
 697:	75 2d                	jne    6c6 <printf+0xe1>
 699:	8b 45 f4             	mov    -0xc(%ebp),%eax
 69c:	8b 00                	mov    (%eax),%eax
 69e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 6a5:	00 
 6a6:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 6ad:	00 
 6ae:	89 44 24 04          	mov    %eax,0x4(%esp)
 6b2:	8b 45 08             	mov    0x8(%ebp),%eax
 6b5:	89 04 24             	mov    %eax,(%esp)
 6b8:	e8 77 fe ff ff       	call   534 <printint>
 6bd:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 6c1:	e9 b4 00 00 00       	jmp    77a <printf+0x195>
 6c6:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
 6ca:	75 46                	jne    712 <printf+0x12d>
 6cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6cf:	8b 00                	mov    (%eax),%eax
 6d1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 6d4:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 6d8:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 6dc:	75 27                	jne    705 <printf+0x120>
 6de:	c7 45 e4 ed 09 00 00 	movl   $0x9ed,-0x1c(%ebp)
 6e5:	eb 1f                	jmp    706 <printf+0x121>
 6e7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6ea:	0f b6 00             	movzbl (%eax),%eax
 6ed:	0f be c0             	movsbl %al,%eax
 6f0:	89 44 24 04          	mov    %eax,0x4(%esp)
 6f4:	8b 45 08             	mov    0x8(%ebp),%eax
 6f7:	89 04 24             	mov    %eax,(%esp)
 6fa:	e8 0d fe ff ff       	call   50c <putc>
 6ff:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 703:	eb 01                	jmp    706 <printf+0x121>
 705:	90                   	nop
 706:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 709:	0f b6 00             	movzbl (%eax),%eax
 70c:	84 c0                	test   %al,%al
 70e:	75 d7                	jne    6e7 <printf+0x102>
 710:	eb 68                	jmp    77a <printf+0x195>
 712:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
 716:	75 1d                	jne    735 <printf+0x150>
 718:	8b 45 f4             	mov    -0xc(%ebp),%eax
 71b:	8b 00                	mov    (%eax),%eax
 71d:	0f be c0             	movsbl %al,%eax
 720:	89 44 24 04          	mov    %eax,0x4(%esp)
 724:	8b 45 08             	mov    0x8(%ebp),%eax
 727:	89 04 24             	mov    %eax,(%esp)
 72a:	e8 dd fd ff ff       	call   50c <putc>
 72f:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 733:	eb 45                	jmp    77a <printf+0x195>
 735:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 739:	75 17                	jne    752 <printf+0x16d>
 73b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 73e:	0f be c0             	movsbl %al,%eax
 741:	89 44 24 04          	mov    %eax,0x4(%esp)
 745:	8b 45 08             	mov    0x8(%ebp),%eax
 748:	89 04 24             	mov    %eax,(%esp)
 74b:	e8 bc fd ff ff       	call   50c <putc>
 750:	eb 28                	jmp    77a <printf+0x195>
 752:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 759:	00 
 75a:	8b 45 08             	mov    0x8(%ebp),%eax
 75d:	89 04 24             	mov    %eax,(%esp)
 760:	e8 a7 fd ff ff       	call   50c <putc>
 765:	8b 45 e8             	mov    -0x18(%ebp),%eax
 768:	0f be c0             	movsbl %al,%eax
 76b:	89 44 24 04          	mov    %eax,0x4(%esp)
 76f:	8b 45 08             	mov    0x8(%ebp),%eax
 772:	89 04 24             	mov    %eax,(%esp)
 775:	e8 92 fd ff ff       	call   50c <putc>
 77a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 781:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 785:	8b 55 0c             	mov    0xc(%ebp),%edx
 788:	8b 45 ec             	mov    -0x14(%ebp),%eax
 78b:	8d 04 02             	lea    (%edx,%eax,1),%eax
 78e:	0f b6 00             	movzbl (%eax),%eax
 791:	84 c0                	test   %al,%al
 793:	0f 85 6e fe ff ff    	jne    607 <printf+0x22>
 799:	c9                   	leave  
 79a:	c3                   	ret    
 79b:	90                   	nop

0000079c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 79c:	55                   	push   %ebp
 79d:	89 e5                	mov    %esp,%ebp
 79f:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7a2:	8b 45 08             	mov    0x8(%ebp),%eax
 7a5:	83 e8 08             	sub    $0x8,%eax
 7a8:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7ab:	a1 28 0c 00 00       	mov    0xc28,%eax
 7b0:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7b3:	eb 24                	jmp    7d9 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b8:	8b 00                	mov    (%eax),%eax
 7ba:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7bd:	77 12                	ja     7d1 <free+0x35>
 7bf:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7c2:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7c5:	77 24                	ja     7eb <free+0x4f>
 7c7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ca:	8b 00                	mov    (%eax),%eax
 7cc:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7cf:	77 1a                	ja     7eb <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7d1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d4:	8b 00                	mov    (%eax),%eax
 7d6:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7d9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7dc:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7df:	76 d4                	jbe    7b5 <free+0x19>
 7e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e4:	8b 00                	mov    (%eax),%eax
 7e6:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7e9:	76 ca                	jbe    7b5 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 7eb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7ee:	8b 40 04             	mov    0x4(%eax),%eax
 7f1:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7f8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7fb:	01 c2                	add    %eax,%edx
 7fd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 800:	8b 00                	mov    (%eax),%eax
 802:	39 c2                	cmp    %eax,%edx
 804:	75 24                	jne    82a <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 806:	8b 45 f8             	mov    -0x8(%ebp),%eax
 809:	8b 50 04             	mov    0x4(%eax),%edx
 80c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80f:	8b 00                	mov    (%eax),%eax
 811:	8b 40 04             	mov    0x4(%eax),%eax
 814:	01 c2                	add    %eax,%edx
 816:	8b 45 f8             	mov    -0x8(%ebp),%eax
 819:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 81c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 81f:	8b 00                	mov    (%eax),%eax
 821:	8b 10                	mov    (%eax),%edx
 823:	8b 45 f8             	mov    -0x8(%ebp),%eax
 826:	89 10                	mov    %edx,(%eax)
 828:	eb 0a                	jmp    834 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 82a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 82d:	8b 10                	mov    (%eax),%edx
 82f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 832:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 834:	8b 45 fc             	mov    -0x4(%ebp),%eax
 837:	8b 40 04             	mov    0x4(%eax),%eax
 83a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 841:	8b 45 fc             	mov    -0x4(%ebp),%eax
 844:	01 d0                	add    %edx,%eax
 846:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 849:	75 20                	jne    86b <free+0xcf>
    p->s.size += bp->s.size;
 84b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 84e:	8b 50 04             	mov    0x4(%eax),%edx
 851:	8b 45 f8             	mov    -0x8(%ebp),%eax
 854:	8b 40 04             	mov    0x4(%eax),%eax
 857:	01 c2                	add    %eax,%edx
 859:	8b 45 fc             	mov    -0x4(%ebp),%eax
 85c:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 85f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 862:	8b 10                	mov    (%eax),%edx
 864:	8b 45 fc             	mov    -0x4(%ebp),%eax
 867:	89 10                	mov    %edx,(%eax)
 869:	eb 08                	jmp    873 <free+0xd7>
  } else
    p->s.ptr = bp;
 86b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 86e:	8b 55 f8             	mov    -0x8(%ebp),%edx
 871:	89 10                	mov    %edx,(%eax)
  freep = p;
 873:	8b 45 fc             	mov    -0x4(%ebp),%eax
 876:	a3 28 0c 00 00       	mov    %eax,0xc28
}
 87b:	c9                   	leave  
 87c:	c3                   	ret    

0000087d <morecore>:

static Header*
morecore(uint nu)
{
 87d:	55                   	push   %ebp
 87e:	89 e5                	mov    %esp,%ebp
 880:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 883:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 88a:	77 07                	ja     893 <morecore+0x16>
    nu = 4096;
 88c:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 893:	8b 45 08             	mov    0x8(%ebp),%eax
 896:	c1 e0 03             	shl    $0x3,%eax
 899:	89 04 24             	mov    %eax,(%esp)
 89c:	e8 2b fc ff ff       	call   4cc <sbrk>
 8a1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 8a4:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 8a8:	75 07                	jne    8b1 <morecore+0x34>
    return 0;
 8aa:	b8 00 00 00 00       	mov    $0x0,%eax
 8af:	eb 22                	jmp    8d3 <morecore+0x56>
  hp = (Header*)p;
 8b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8b4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 8b7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8ba:	8b 55 08             	mov    0x8(%ebp),%edx
 8bd:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 8c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8c3:	83 c0 08             	add    $0x8,%eax
 8c6:	89 04 24             	mov    %eax,(%esp)
 8c9:	e8 ce fe ff ff       	call   79c <free>
  return freep;
 8ce:	a1 28 0c 00 00       	mov    0xc28,%eax
}
 8d3:	c9                   	leave  
 8d4:	c3                   	ret    

000008d5 <malloc>:

void*
malloc(uint nbytes)
{
 8d5:	55                   	push   %ebp
 8d6:	89 e5                	mov    %esp,%ebp
 8d8:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8db:	8b 45 08             	mov    0x8(%ebp),%eax
 8de:	83 c0 07             	add    $0x7,%eax
 8e1:	c1 e8 03             	shr    $0x3,%eax
 8e4:	83 c0 01             	add    $0x1,%eax
 8e7:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 8ea:	a1 28 0c 00 00       	mov    0xc28,%eax
 8ef:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8f2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8f6:	75 23                	jne    91b <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 8f8:	c7 45 f0 20 0c 00 00 	movl   $0xc20,-0x10(%ebp)
 8ff:	8b 45 f0             	mov    -0x10(%ebp),%eax
 902:	a3 28 0c 00 00       	mov    %eax,0xc28
 907:	a1 28 0c 00 00       	mov    0xc28,%eax
 90c:	a3 20 0c 00 00       	mov    %eax,0xc20
    base.s.size = 0;
 911:	c7 05 24 0c 00 00 00 	movl   $0x0,0xc24
 918:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 91b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 91e:	8b 00                	mov    (%eax),%eax
 920:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 923:	8b 45 f4             	mov    -0xc(%ebp),%eax
 926:	8b 40 04             	mov    0x4(%eax),%eax
 929:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 92c:	72 4d                	jb     97b <malloc+0xa6>
      if(p->s.size == nunits)
 92e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 931:	8b 40 04             	mov    0x4(%eax),%eax
 934:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 937:	75 0c                	jne    945 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 939:	8b 45 f4             	mov    -0xc(%ebp),%eax
 93c:	8b 10                	mov    (%eax),%edx
 93e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 941:	89 10                	mov    %edx,(%eax)
 943:	eb 26                	jmp    96b <malloc+0x96>
      else {
        p->s.size -= nunits;
 945:	8b 45 f4             	mov    -0xc(%ebp),%eax
 948:	8b 40 04             	mov    0x4(%eax),%eax
 94b:	2b 45 ec             	sub    -0x14(%ebp),%eax
 94e:	89 c2                	mov    %eax,%edx
 950:	8b 45 f4             	mov    -0xc(%ebp),%eax
 953:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 956:	8b 45 f4             	mov    -0xc(%ebp),%eax
 959:	8b 40 04             	mov    0x4(%eax),%eax
 95c:	c1 e0 03             	shl    $0x3,%eax
 95f:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 962:	8b 45 f4             	mov    -0xc(%ebp),%eax
 965:	8b 55 ec             	mov    -0x14(%ebp),%edx
 968:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 96b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 96e:	a3 28 0c 00 00       	mov    %eax,0xc28
      return (void*)(p + 1);
 973:	8b 45 f4             	mov    -0xc(%ebp),%eax
 976:	83 c0 08             	add    $0x8,%eax
 979:	eb 38                	jmp    9b3 <malloc+0xde>
    }
    if(p == freep)
 97b:	a1 28 0c 00 00       	mov    0xc28,%eax
 980:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 983:	75 1b                	jne    9a0 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 985:	8b 45 ec             	mov    -0x14(%ebp),%eax
 988:	89 04 24             	mov    %eax,(%esp)
 98b:	e8 ed fe ff ff       	call   87d <morecore>
 990:	89 45 f4             	mov    %eax,-0xc(%ebp)
 993:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 997:	75 07                	jne    9a0 <malloc+0xcb>
        return 0;
 999:	b8 00 00 00 00       	mov    $0x0,%eax
 99e:	eb 13                	jmp    9b3 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9a3:	89 45 f0             	mov    %eax,-0x10(%ebp)
 9a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9a9:	8b 00                	mov    (%eax),%eax
 9ab:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 9ae:	e9 70 ff ff ff       	jmp    923 <malloc+0x4e>
}
 9b3:	c9                   	leave  
 9b4:	c3                   	ret    
