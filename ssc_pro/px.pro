pro px
  restore,'averagep.sav'
  sss=['square','triangle','circle','+']
  ccc=[[0,0,0],[0,0,240],[196,0,0],[0,196,0]]

  for i=0,3 do begin
    for j=0,3 do begin
      ;iplot,band[i,j,*],z,linestyle=6,color=ccc[*,i],symbol=sss[j],sym_thick=5,sym_size=3,/overplot,/xlog
      iplot,px_a[i,j,*],z,linestyle=6,color=ccc[*,i],symbol=sss[j],sym_thick=5,sym_size=3,/overplot,/xlog
      ;iplot,px_a[i,j,*],z,linestyle=6,color=ccc[*,i],symbol='circle',sym_thick=5,sym_size=3,/overplot,/xlog
    endfor
  endfor
end