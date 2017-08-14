pro plottrace
  restore,'./trace.sav'
  print,'Start reading trace'
for n=0,19 do begin
    iplot,x[n,*],y[n,*],/overplot
endfor
end