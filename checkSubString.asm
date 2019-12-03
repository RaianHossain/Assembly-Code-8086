INCLUDE 'EMU8086.INC'
.MODEL SMALL
.DATA

   MSG1 DW "ENTER A STRING: $"
   VAR1 DW 100 DUP('$')
   MSG2 DW "ENTER SUB STRING: $"
   VAR2 DW 100 DUP('$')
   LEN1 DB ?
   LEN2 DB ?
   
.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    MOV ES, AX
    
    
    MOV SI, OFFSET VAR1
    
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    MOV BL, 0
  L1:
    
    MOV AH, 1
    INT 21H
    CMP AL, 13
    JE L2ND
    MOV [SI], AL 
    INC BL
    INC SI
    JMP L1
    
    
  L2ND:  
    MOV DX,10
    MOV AH,2
    INT 21H
    
    LEA DX,MSG2
    MOV AH,9
    INT 21H
            
            
    MOV LEN1,BL
    
    
    MOV DI, OFFSET VAR2
    MOV BL,0
    
    JMP L2
    
    
    
    
  L2:
    
     
    
    MOV AH, 1
    INT 21H
    CMP AL, 13
    JE INPUTDONE
    MOV [DI], AL
    INC BL
    INC DI
    JMP L2
    
    
 INPUTDONE:
    
    MOV LEN2, BL
    
     
    MOV DX,10
    MOV AH,2
    INT 21H
    
    ;MOV DL,LEN1
    ;MOV AH,2
    ;INT 21H
    
    ;MOV DL,LEN2
    ;MOV AH,2
    ;INT 21H 
    
    
    ;MOV DX, 10
    ;MOV AH, 2
    ;INT 21H  
    
    ;MOV BL, LEN1
    MOV SI, OFFSET VAR1
    MOV DI, OFFSET VAR2
    MOV BL, 0
    
    
  OUTERLOOP:
  
    MOV AL, [DI]
    
    CMP [SI], AL
    JNE PAYNAI
    INC SI
    INC DI 
    INC BL
    CMP BL, LEN2
    JE FINISH
    JMP OUTERLOOP
    
    
  PAYNAI:
    
    CMP BL, 0
    JNE GREATER
    JMP NOTGREATER
    
  GREATER:
    MOV DI, OFFSET VAR2
    MOV BL, 0
    JMP NOTGREATER
    
  NOTGREATER:
   
    INC SI
    CMP [SI], 36
    JE EXIT
    JMP OUTERLOOP
    
  FINISH:
    PRINT "FOUND"
    JMP HAHA  
    
  EXIT:
    PRINT "NOT FOUND"
    JMP HAHA
    
    
 HAHA:
      
      
    
    
    
  
    
    


       
    
    
      