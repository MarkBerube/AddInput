AddInput:	lodd on:
        stod 4095
        call xbsywt:
        loco str1:
nextw:  pshi
        addd c1:
        stod pstr1:
        pop
        jzer crnl:
        stod 4094
        push
        subd c255:
        jneg crnl:
        call sb:
        insp 1
        push
        call xbsywt:
        pop
        stod 4094
        call xbsywt:
        lodd pstr1:
        jump nextw:
crnl:   lodd cr:
        stod 4094
        call xbsywt:
        lodd nl:
        stod 4094
        call xbsywt:
        lodd on:                ; mic1 program to print string
        stod 4093               ; and scan in a 1-5 digit number
bgndig: call rbsywt:        ; using CSR memory locations
        lodd 4092
        subd numoff:
        push
nxtdig:    call rbsywt:
    lodd 4092
    stod nxtchr:
    subd nl:
        jzer endnum:
    mult 10
    lodd nxtchr:
    subd numoff:
    addl 0
    stol 0
    jump nxtdig:
endnum: pop
    stod binnum:
    jump start2:

xbsywt: lodd 4095
        subd mask:
        jneg xbsywt:
        retn
rbsywt: lodd 4093
        subd mask:
        jneg rbsywt:
        retn

loop1:  jzer finish:
        subd c1:
        stod lpcnt:
        lodl 1
        jneg add1:
        addl 1
        stol 1
        lodd lpcnt:
        jump loop1:
add1:   addl 1
        addd c1:
        stol 1
        lodd lpcnt:
        jump loop1:
finish: lodl 1
        retn


start2:  lodd on:
        stod 4095
        call xbsywt:
        loco str2:
nextw2:  pshi
        addd c1:
        stod pstr2:
        pop
        jzer crnl2:
        stod 4094
        push
        subd c255:
        jneg crnl2:
        call sb:
        insp 1
        push
        call xbsywt:
        pop
        stod 4094
        call xbsywt:
        lodd pstr2:
        jump nextw2:
crnl2:   lodd cr:
        stod 4094
        call xbsywt:
        lodd nl:
        stod 4094
        call xbsywt:
    lodd on:              
        stod 4093              
bgndig2: call rbsywt:
    lodd 4092
    subd numoff:
    push
nxtdig2:    call rbsywt:
    lodd 4092
    stod nxtchr2:
    subd nl:
        jzer endnum2:
    mult 10
    lodd nxtchr2:
    subd numoff:
    addl 0
    stol 0
    jump nxtdig2:
endnum2: pop
    stod binnum2:
    jump resultstart:
rbsywt: lodd 4093
        subd mask:
        jneg rbsywt:
        retn

sb:     loco 8
loop2:  jzer finish:
        subd c1:
        stod lpcnt2:
        lodl 1
        jneg add2:
        addl 1
        stol 1
        lodd lpcnt2:
        jump loop2:
add2:   addl 1
        addd c1:
        stol 1
        lodd lpcnt2:
        jump loop2:
resultstart:	  lodd on:
		        stod 4095
		        call xbsywt:
		        loco rstr:
resultnextw:	  pshi
		        addd c1:
		        stod prstr:
		        pop
		        jzer resultcrnl:
		        stod 4094
		        push
		        subd c255:
		        jneg resultcrnl:
		        call sb:
		        insp 1
		        push
		        call xbsywt:
		        pop
		        stod 4094
		        call xbsywt:
		        lodd prstr:
		        jump resultnextw:
resultcrnl:	   lodd cr:
		        stod 4094
		        call xbsywt:
		        lodd nl:
		        stod 4094
		        call xbsywt:
addnums: lodd binnum:
		addd binnum2:
		jneg overflow:
		stod resbin:
        push
		lodl 2
		popi
		loco 0
		push
getnums: loco 10
		push
		lodd resbin:
		push
		div
		pop
		stod resbin:
		pop
		addd numoff:
		stod digit:
		pop
		pop
		lodd digit:
		push
		lodd resbin:
		jzer swrite:
		jump getnums:
swrite: lodd on:
		stod 4095
		call xbsywt:
mwrite: pop
	    stod 4094
        jzer fwrite:
		jump mwrite:
fwrite: lodd cr:
        stod 4094
		call xbsywt:
		lodd nl:
		stod 4094
	call xbsywt:
        loco 0
		halt 
retn

overflow:			  lodd on:
			        stod 4095
			        call xbsywt:
			        loco ostr:
ovnextw:			  pshi
			        addd c1:
			        stod postr:
			        pop
			        jzer ovcrnl:
			        stod 4094
			        push
			        subd c255:
			        jneg ovcrnl:
			        call sb:
			        insp 1
			        push
			        call xbsywt:
			        pop
			        stod 4094
			        call xbsywt:
			        lodd postr:
			        jump ovnextw:
ovcrnl:		   lodd cr:
			        stod 4094
			        call xbsywt:
			        lodd nl:
			        stod 4094
			        call xbsywt:

		lodd cn1:
		halt
retn

cn1:	 -1
numoff: 48
nxtchr: 0
nxtchr2: 0
binnum:	0
binnum2: 0
resbin:	0
digit:	0
lpcnt:  0
lpcnt2: 0
mask:   10
on:     8
nl:     10
cr:     13
c1:     1
c255:   255
pstr1:  0
str1:   "PLEASE ENTER AN INTEGER BETWEEN 1 AND 32767"
pstr2:  0
str2:   "PLEASE ENTER AN INTEGER BETWEEN 1 AND 32767"
prstr: 0	
rstr:	"THE SUM OF THESE INTEGERS IS:"
postr:	0
ostr:	"OVERFLOW, NO SUM POSSIBLE"
xbsywt:	 lodd 4095
		 subd mask:
		 jneg xbsywt:
		 retn