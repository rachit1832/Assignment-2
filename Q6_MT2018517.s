	AREA     appcode, CODE, READONLY
	EXPORT __main
	ENTRY
__main  FUNCTION

		MOV R1, #50 	; Move first no. to R1  
		MOV R2, #35		; Loading content of b in register r1
while  	CMP R1, R2 		; Compare both numbers
		BNE jump 		; if numbers are not equal then execute while loop
stop    B stop 			; if number are equal then don't execute while loop
jump  	BGT JUMP2 		; jump if a>b
		SUB R2, R2, R1 	; if b>a then R2=R2-R1
		B Finish		
JUMP2 	SUB R1, R1, R2 	; if a>b then R1=R1-R2
Finish	CMP R1, R2		; RESULT OF GCD WILL BE DISPLAYED IN BOTH THE REGISTERS IF BOTH NUMBERS BECOME EQUAL AFTER OPERATIONS		
		BNE while
	ENDFUNC
	END
