XOR EBX, EBX;
PUSH EBX;
LEA EBP, [EBX + 1];
LEA EDX, [EBX + 2];
LEA EAX, [EBX + 3];
MOV ECX, ESP;
INT 80h;

POP ECX;
SUB ECX, '00';
CMP ECX, EBX;
MOVZX ESI, CH;
MOVZX ECX, CL;
JLE @skip;
  LEA ECX, [ECX + ECX*4];
  LEA ECX, [ESI + ECX*2];
@skip:

SHL EBP, CL;
LEA ESI, [EBP - 1];
XOR EDI, EDI;
MOV EDX, EDI;
MOV EAX, '  ';
MOV EBX, '▲ ';

@loop:
  PUSH 0Ah;

  @line:
    MOV ECX, EAX;
    TEST EDI, ESI;
    CMOVE ECX, EBX;
    ADD EDX, 4;
    PUSH ECX;
    DEC EDI;
  JGE @line;

  SUB EDI, ESI;
  @fill:
    PUSH EAX;
    ADD EDX, 4;
    ADD EDI, 2;
  JLE @fill;
  LEA ESP, [ESP + EDI*2 + 2];
  NEG EDI;
  LEA EDX, [EDX + EDI*2 + 2];

  MOV ECX, ESP;
  PUSH EAX;
  PUSH EBX;
  MOV EAX, 4;
  MOV EBX, 1;
  INT 80h;
  POP EBX;
  POP EAX;
  ADD ESP, EDX;
  XOR EDX, EDX;

  MOV EDI, EBP;
  SUB EDI, ESI;
  DEC ESI;
JGE @loop;

XOR EBX, EBX;
LEA EAX, [EBX + 1];
INT 80h;