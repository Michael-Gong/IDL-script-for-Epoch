pro p427
  ccc=[[0,0,240],[196,0,0],[0,196,0]]
  pre=['no','qe','rr']
  suf=['0','1','2']
  sty=[5,1,0]
  for i=0,2 do begin
    for j=0,2 do begin
      restore,'p427'+pre[i]+suf[j]+'.sav'
      ;where(theta_y)
      iplot,theta_x/!pi*180,theta_y*5e-6/(2*!pi/1000),/ylog,linestyle=sty[j],$
        color=ccc[*,i],/overplot,thick=4
    endfor
  endfor

end