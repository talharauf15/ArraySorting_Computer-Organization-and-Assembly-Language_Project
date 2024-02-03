dosseg
.model small
.stack 100h
.data


string1 db 'BUBBLE SORTING$'
string2 db 'Enter 10 elements $'
string3 db 'in array for sorting $' 
string4 db 'Ascending order :$'
string5 db 'Descending order :$'

arr db 10 dup(?)

.code

main proc

mov ax,@data          
mov ds,ax            

mov dx,offset string1    ; first string address
mov ah,9              ; print string command
int 21h         ; intrept command

mov dx,10             ; new line
mov ah,2	      ; print command
int 21h		; intrept command

mov dx,13             ; start from new line
mov ah,2	      ; print command
int 21h		; intrept command

mov dx,offset string2    ; second string address
mov ah,9	      ; print string command
int 21h		; intrept command

mov dx,offset string3    ; third string address
mov ah,9	      ; print string command
int 21h		; intrept command
  
mov dx,10             ; new line
mov ah,2	      ; print command
int 21h		; intrept command

mov dx,13             ; start from new line
mov ah,2	      ; print command
int 21h		; intrept command        




mov cx,10	  ;cx=10
mov bx,offset arr ;bx=address of first index of array 
mov ah,1	  ;input command

input:		;input loop
int 21h		;intrept command
mov[bx],al	;move input in bx which is index of array
inc bx		;move next index of array
loop input

mov cx,10       ;cx=10     
dec cx

loop1:
mov bx,cx	;cx=bx
mov si,0	;si=0

compare:
mov al,arr[si]
mov dl,arr[si+1]
cmp al,dl

jc noswap

mov arr[si],dl
mov arr[si+1],al

;push dx
;push ax
;pop arr[si+1]
;pop arr[si]            

noswap:

inc si		;increment in si
dec bx		;decrement in bx
jnz compare	;compare command

loop loop1

mov ah,2	;printcommand
mov dl,10	; new line
int 21h		; intrept command

mov dl,13	; start from new line
int 21h		; intrept command


mov cx,10		;cx=10
mov bx,offset arr	;bx=address of first index of array 

mov dx,offset string4   ; forth string address                         
mov ah,9	        ; print string command
int 21h		 	; intrept command

mov dx,10             ; new line
mov ah,2	      ; print command
int 21h		      ; intrept command

mov dx,13             ; start from new line
mov ah,2	      ; print command
int 21h		      ; intrept command

display:
mov dl,[bx]		;move bx to dl 
mov ah,2		;print command
int 21h			; intrept command

inc bx                 ; increment bx

loop display
mov dx,10             ; new line
mov ah,2	      ; print command
int 21h			; intrept command

mov dx,13             ; start from new line
mov ah,2	      ; print command
int 21h               ; intrept command         


;Array print in Decending order


mov bx,offset arr	;bx=address of first index of array 
mov cx,10		;cx=10
dec cx			;decrement cx

loop2:
mov bx,cx		
mov si,0

compare1:
mov al,arr[si]
mov dl,arr[si+1]
cmp al,dl

jnc noswap1

mov arr[si],dl                                                       
mov arr[si+1],al

;push dx
;push ax
;pop arr[si+1]
;pop arr[si]

noswap1:
inc si
dec bx
jnz compare1

loop loop2 

mov ah,2	; print command
mov dl,10
int 21h		; intrept command

mov dl,13	; start from new line
int 21h		; intrept command

mov cx,10
mov bx,offset arr

mov dx,offset string5    ; fifth string address
mov ah,9	      	 ; print string command
int 21h			 ; intrept command

mov dx,10             ; new line
mov ah,2	      ; print command
int 21h		      ; intrept command

mov dx,13             ; start from new line
mov ah,2	      ; print command
int 21h		      ; intrept command

display1:
mov dl,[bx]
mov ah,2
int 21h		      ; intrept command
                                            
inc bx
loop display1


mov ah,4ch
int 21h		      ; intrept command
main endp
end main
















