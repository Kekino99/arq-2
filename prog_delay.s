; MIPs version of series.cpp
; for i in range(5): sum += 2.0**i/3.0**(i+1)
       .data
x:     .double 2.0
s:     .double 3.0
n:     .double 9.0
i:     .word 5
res:   .double 0.0
       .text
       l.d   F1,x(R0)     ;F1=x will be used as cons
       L.D   F2,s(R0)     ;F2=y will be used as cons
       L.D   F3,x(R0)     ;F3=s
       l.d   f4,n(r0)     ;f4=n
       ld    r1,i(r0)	  ;r1=5

Loop:  div.d   f5,f3,f4  ; calculate powers
       mul.d   f3,f3,f1  ; calculate powers
       mul.d   f4,f4,f2  ; calculate powers
       DADDI   R1,R1,-1  ; decrement r1
       bne     r1,r0,Loop
       add.d   f6,f6,f5  ; 
       s.d     f6,res(r0)
       HALT
