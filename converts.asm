
;Author: Eurese Antonio A. Bustamante
;Program: Coverts decimal to binary and decimal to hex
;Date: Dec 12, 2021
.MODEL SMALL     
	
.STACK 100H

.DATA
    my_int dw 240 ;#DEFINE MY_INT 240
.CODE
    MAIN PROC   ;void main(){

    MOV AX,@DATA
    MOV DS,AX
     
    
    
    mov ah,2
	mov bh,0
	mov dl,30 ;row
	mov dh,11 ;col
	int 10h
	
    mov ax,my_int  ; int num = MY_INT;               
    call TO_BINARY ; to_binary(num);
    
    mov ah,2
	mov bh,0
	mov dl,30 ;row
	mov dh,14 ;col
	int 10h
	
    mov ax,my_int  ; num = MY_INT; //because ax was set to 0 after to_binary() call   
    call TO_HEX    ; to_hex(num);
    
    MOV AH,4CH  ;return;
    INT 21H

    MAIN ENDP   ;}  

    TO_BINARY PROC
    mov cx,0    ;initialize count
    mov dx, 0  
    
    while:      ;
    cmp ax,0    ;while( num != 0) go inside loop
    je print_bin; else break;
  
    mov bx, 2  ;initialize bx to 2
    div bx      ;divide it by 2
                ;to convert it to binary
    push dx     ;push it in the stack
    inc cx      ;increment the count
    xor dx,dx   ;set dx to 0
    jmp while; repeat while loop


    print_bin: ;
    cmp cx,0    ;while(top != 0) go inside loop
    je exit1     ; else break;
    
    pop dx      ;pop the top of stack
    add dx, 48  ;add 48 for ASCII counterpart
    mov ah,02h
    int 21h     ;interrupt to print a character
  
    dec cx      ; top-=1;
    jmp print_bin; repeat while loop
    
    exit1: 
    ret
    TO_BINARY ENDP

    
    TO_HEX PROC
    mov cx,0    ;initialize count
    mov dx, 0  
    
    do_while: 
    cmp ax,0    ;while( num != 0) go inside loop
    je print_hex;else break;
  
    mov bx, 16  ;   int base = 16
    div bx      ;   divide it by 16
                ;   to convert it to hex
    push dx     ;   stack[count] = dx;
    inc cx      ;   count+=1;
    xor dx,dx   ;   dx = 0
    jmp do_while
   
  

    print_hex: ;
    cmp cx,0    ;while(top != 0)
    je exit2     ;
    pop dx      ;pop the top of stack
    cmp dx, 9   ;
    jle continue;if (stack[top] < 9) continue;
    add dx, 7   ;else, add 7
    continue:
    add dx, 48  ;add 48 for ASCII counterpart
    mov ah,02h
    int 21h     ;interrupt to print a character
  
    dec cx      ; top-=1;
    jmp print_hex; repeat while loop
    
    exit2: 
    ret
    TO_HEX ENDP

    END MAIN