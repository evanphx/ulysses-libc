.text
.global _start
_start:
  pop %edi
  call main
  push %eax
  call exit

_old_start:
	xor %ebp,%ebp
	pop %edi
	mov %esp,%esi
	and $-16,%esp
	push %ebp
	push %ebp
	push %esi
	push %edi
	call __dynlink
	mov %esi,%esp
1:	dec %edi
	pop %esi
	cmp $-1,%esi
	jz 1b
	inc %edi
	push %esi
	push %edi
	xor %edx,%edx
	jmp *%eax
