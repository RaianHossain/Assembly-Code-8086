INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
   VAR1 DW 100 DUP('$')
   COUNT DB ?
  
.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    MOV ES, AX
    
    
    
    MOV SI, offset VAR1
    MOV CL, 0
    
L1:
    MOV AH, 1
    INT 21H
    CMP AL, 13
    JE END
    CMP AL, 32
    JE L1
    CMP AL,44
    JE L1
    CMP AL,39
    JE L1
    CMP AL, 46
    JE L1      
    MOV [SI], AL
    INC CL
    INC SI
    JMP L1
         
    
END:

    
    
    MOV COUNT,CL
    MOV CH,0 
    
    
    MOV SI, OFFSET VAR1
    
   L2:
    
    MOV BX, [SI]
    
    ;PRINTING SI
    ;MOV AH, 2
    ;MOV DX, [SI]
    ;INT 21H
    
    ;PRINT " "
    
     PUSH BX
    
    ;PRINTING VALUE OF STACK
     ;MOV AH, 2
     ;MOV DX, BX
     ;INT 21H
     
     ;PRINT " "
    
    INC SI
    LOOP L2
    



    
    MOV SI, OFFSET VAR1  
    
    MOV CL,COUNT
     
 L3:
 
    CMP CL,0
    
    JE TOTAL 
    
    
    ;MOV AH, 2
    ;MOV DL, CL
    ;INT 21H   
    ;PRINT " "
    
    
    POP BX
    
    ;MOV AH, 2
    ;MOV DL, BL
    ;INT 21H   
    ;PRINT " "
    
     
    
    ;MOV AH, 2
    ;MOV DX, [SI]
    ;INT 21H   
    ;PRINT " "
    
    
    MOV BH,[SI]
    
    
    CMP BL,BH 
    
    JNE EXT
    
    INC SI
    
    DEC CL
    
    JMP L3
    
    
        
 EXT:
      MOV AH,2
      MOV DX,0DH
      INT 21H
      
      MOV AH,2
      MOV DX,0AH
      INT 21H
      
      PRINT "NOT PALINDROM"
      JMP HAHA
    
    
 TOTAL:
    
      MOV AH,2
      MOV DX,ODH
      INT 21H
      
      
      MOV AH,2
      MOV DX,0AH
      INT 21H
    
      PRINT "PALINDROM"
      JMP HAHA
      
      
 HAHA:   
    MOV AH, 4CH
    INT 21H
    
MAIN ENDP
END MAIN
     
    
    
    
    
   