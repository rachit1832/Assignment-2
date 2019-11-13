     ; Tanx
	 AREA     appcode, CODE, READONLY
     EXPORT __main
     ENTRY 
__main  FUNCTION 
		VLDR.F32 S1, =2.443448;  //x is loaded in S1
		MOV R7,#1; 		  //regsiter to calculate factorial
		MOV R8,#2;		  
		MOV R9,#3;
		MOV R1,#0;		// register for number of iterations
		VLDR.F32 S7, =1; 
		VMUL.F32 S2,S1,S1; // s2=x^2
		 
JUMP	VDIV.F32 S1,S1,S7; // s1=x^(2n+1)/(2n+1)!
		VADD.F32 S0,S0,S1; // s0 register for holding value of sin(x) after every iteration 
		VMUL.F32 S1,S2,S1; 
		MUL R7,R8,R9; // calculating 2n+1!
		ADD R8,R8,#2; 
		ADD R9,R9,#2; 
		VNEG.F32 S1,S1; // negating S1 for further iteraions
		VMOV.F32 S7, R7; //copying 2n+1! to s7
		VCVT.F32.U32 S7,S7; 
		ADD R1,R1,#1; 
		CMP R1,#25; // no. of iterations equal to 25
		BNE JUMP

	
	
	
	
	
		MOV R5, #3;  
		MOV R6, #4;
		VLDR.F32 S5, =1;
		VMOV.F32 S15, S2;  
		VNEG.F32 S15,S15;
		VMOV.F32 S6,S15;
		VLDR.F32 S7, =2;  
		MOV R1,#0;
		
JUMP2	VDIV.F32 S6,S6,S7; //s1=x^(2n)/(2n)!
		VADD.F32 S5,S5,S6; // s5 register for holding value of cos(x) after every iteration 
		VMUL.F32 S6,S6,S2;  
		MUL R7,R5,R6; // R7 for calculating 2n!
		VMOV.F32 S7, R7; // copyinh factorial value to S7
		VCVT.F32.U32 S7,S7; 
		VNEG.F32 S6,S6; //negating S6 for further iterations
		ADD R5,R5,#2;
		ADD R6,R6,#2;
		ADD R1,R1,#1;
		CMP R1,#25; // no. of iterations 
		BNE JUMP2
		
		VDIV.F32 S10,S0,S5; //tan(x)=sin(x)/cos(x)

stop    B stop ; stop program?
	ENDFUNC
	END 
