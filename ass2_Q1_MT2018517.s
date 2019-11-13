       ;Exponential Series
  	    AREA    appcode ,CODE,READONLY
        EXPORT __main
        ENTRY
__main    FUNCTION
		
        MOV R0,#15;Number of iterations
        MOV R1,#1; variable for counting
				
		LDR R3,= 0x00000001 ; Register to store final result
	    VMOV.F S0,R3 ; 
	    VCVT.F32.U32 S0,S0
	   
	    LDR R4,= 0x00000001 ; Temprory register to hold intermediate multiply results
	    VMOV.F S1,R4 ; 
	    VCVT.F32.U32 S1,S1
	   
	    LDR R5,= 0x00000004 ;  x
	    VMOV.F S2,R5 ; 
	    VCVT.F32.U32 S2,S2
	   
	    LDR R6,= 0x00000001 ; Temprory register to hold factorial value
	    VMOV.F S6,R6 ; 
	    VCVT.F32.U32 S6,S6
				
jump1    CMP R1,R0; Compare  i & n 

        BLE jump; if i is less than n jump to jump
        B stop; otherwise jump to stop
		
jump    VMUL.F32 S1,S1,S2; temp = temp*x
		VMOV.F32 S3,S1;
		
        VMOV.F32 S5,R1; 
        VCVT.F32.U32 S5, S5; Converting into floating point number
		
		
		VMUL.F32 S6,S6,S5
		
        VDIV.F32 S3,S3,S6;Dividing temp by factorial 
        VADD.F32 S0,S0,S3;Final Sum
		
		
		
        ADD R1,R1,#1;
        B jump1;  
stop    B stop
        ENDFUNC
        END