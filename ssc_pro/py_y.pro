pro py_y
w0=[75,50,25]
t0=[6,4,2]
c0=['r','g','k']
s0=['circle','square','triangle']
for iw=0,2 do begin
  iplot
  for it=0,2 do begin
    restore,'tracenow'+strtrim(string(w0[iw]),2)+'t'+strtrim(string(t0[it]),2)+'.sav'    
    iplot,y[*,0]/1.0e-6,py[*,1059]/(9.1e-31*3e8),linestyle=6,color=c0[it],$
      symbol=s0[iw],sym_thick=2,sym_size=1,SYM_INCREMENT=40,/overplot
    ;iplot,y[*,0]/1.0e-6,gamma[*,1059],linestyle=6,color=c0[it],$
    ;  symbol=s0[iw],sym_thick=2,sym_size=1,SYM_INCREMENT=40
    ;iplot,y[*,0]/1.0e-6,px[*,1059]/(9.1e-31*3e8),linestyle=6,color=c0[it],$
    ;  symbol=s0[iw],sym_thick=2,sym_size=1,SYM_INCREMENT=40,/overplot
  endfor
endfor
end