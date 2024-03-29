$INCLUDE(.\Servo.h)
$INCLUDE (AT89S52.inc)

	ORG 0000H
	LJMP MAIN
	ORG 0013H
	LJMP ISR_IT1

MAIN:
	MOV P2, #0
	MOV IE, #84H
	MOV TMOD, #1
	SJMP $


ISR_IT1:
	MOV R3, #30
	BACK1:
		MOV 	TL0, #70H
		MOV 	TH0, #0BCH
		ACALL TIMER_GO
		MOV 	TL0, #80H
		MOV 	TH0, #0FBH
		ACALL TIMER_GO
		DJNZ R3, BACK1



		MOV 	TL0, #25H
		MOV 	TH0, #0FAH
		ACALL TIMER_GO
		MOV 	TL0, #0D9H
		MOV 	TH0, #0BDH
		ACALL TIMER_GO
		RETI

TIMER_GO:
	SETB	TR0
	JNB	TF0, $
	CLR	TR0
	CLR	TF0
	CPL 	P2.0
	RET
END