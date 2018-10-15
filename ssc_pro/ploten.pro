pro ploten

q = 0 ; 1 denotes the qed and 0 indicates the radiation reaction 

sss=['+','triangle','square','circle']
ccc=[[0,0,0],[0,0,240],[196,0,0],[0,196,0]]

if (q gt 0) then begin 
  restore,'en_aq.sav'
endif else begin
  restore,'en_a.sav'
endelse

for i=0,3 do begin
  for j=0,3 do begin
    iplot,en_a[i,j,*],z,linestyle=6,color=ccc[*,i],symbol=sss[j],sym_thick=5,sym_size=3,/overplot,/xlog
    ;iplot,en_b[i,j,*],z,linestyle=6,color=ccc[*,i],symbol=sss[j],sym_thick=5,sym_size=3,/overplot,/xlog
  endfor
endfor

end